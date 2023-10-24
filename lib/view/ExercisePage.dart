import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:meditasyon/constants.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = true;
  bool isAudioPlaying = true;
  /*  static Color purple = Color.fromRGBO(123, 153, 250, 1);
  static Color blue = const Color.fromRGBO(83, 205, 216, 1);
  static Color green = const Color.fromRGBO(150, 234, 184, 1);
  // static Color bgpink = Color.fromRGBO(255, 252, 255, 1);
  static Color black = Color.fromRGBO(39, 39, 39, 1); */

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 19),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });

    player.play(AssetSource("audio/ses.mp3"));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "4-7-8 Tekniği",
          style: ExcerciseTitleTextStyle(),
        ),
        leading: InkWell(
          onTap: () {
            if (isPlaying) {
              player.pause();
              Navigator.pop(context);
            } else if (!isPlaying) {
              Navigator.pop(context);
            }
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Constants.purple,
            size: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
                borderRadius: BorderRadius.circular(100),
                splashColor: Colors.transparent,
                onTap: () {
                  if (isAudioPlaying) {
                    player.pause();
                    setState(() {
                      isAudioPlaying = false;
                    });
                  } else {
                    if (controller.isAnimating) {
                      player.resume();
                    }

                    setState(() {
                      isAudioPlaying = true;
                    });
                  }
                },
                child: isAudioPlaying
                    ? Icon(
                        Icons.volume_up_rounded,
                        size: 28,
                        color: Constants.purple,
                      )
                    : Icon(
                        Icons.volume_off_rounded,
                        size: 28,
                        color: Constants.purple,
                      )),
          ),
        ],
        toolbarHeight: 54,
        backgroundColor: Constants.purple.withOpacity(.15),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ExercisePage(0.5789473683, 0.210526315789),
    );
  }

  ExercisePage(double i1, double i2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 16,
        ),
        Expanded(child: SizedBox()),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 350,
              child: CircularPercentIndicator(
                radius: 134,
                lineWidth: 16,
                animation: true,
                percent: progress,
                backgroundWidth: 6,
                reverse: false,
                backgroundColor: Constants.purple.withOpacity(.2),
                onAnimationEnd: () {
                  controller.repeat();
                },
                animationDuration: progress.toInt(),
                circularStrokeCap: CircularStrokeCap.round,
                linearGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                  colors: <Color>[Constants.purple, Constants.lightPurple],
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => controller.value <= i1
                  ? (controller.value <= i2
                      ? Text("Nefes Al\n${countText}",
                          textAlign: TextAlign.center,
                          style: ExcerciseTextStyle())
                      : Text(
                          "Nefes Tut\n${countText}",
                          textAlign: TextAlign.center,
                          style: ExcerciseTextStyle(),
                        ))
                  : Text("Nefes Ver\n${countText}",
                      textAlign: TextAlign.center, style: ExcerciseTextStyle()),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: isPlaying ? Constants.lightPurple : Constants.purple,
                ),
                height: 60,
                width: 60,
                child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      if (controller.isAnimating) {
                        controller.stop();
                        if (isAudioPlaying) {
                          player.pause();
                        }

                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        controller.reverse(
                            from:
                                controller.value == 0 ? 1.0 : controller.value);
                        if (isAudioPlaying) {
                          player.resume();
                        }
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    child: !isPlaying
                        ? Icon(
                            Icons.play_arrow_rounded,
                            size: 42,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.pause_rounded,
                            size: 42,
                            color: Colors.white,
                          )),
              ),
              SizedBox(
                width: 24,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constants.lightPurple),
                height: 60,
                width: 60,
                child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      controller.reset();
                      setState(() {
                        isPlaying = true;
                      });
                    },
                    child: Icon(
                      Icons.replay_rounded,
                      size: 36,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }

  TextStyle ExcerciseTextStyle() {
    return TextStyle(
        fontSize: 26,
        color: Constants.black,
        fontFamily: "hankenB",
        letterSpacing: 0);
  }

  TextStyle ExcerciseTitleTextStyle() {
    return TextStyle(
        fontSize: 18,
        color: Constants.purple,
        fontFamily: "hankenB",
        letterSpacing: 0);
  }
}
