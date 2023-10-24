import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditasyon/components/customListTile.dart';
import 'package:meditasyon/constants.dart';
import 'package:meditasyon/view/ExercisePage.dart';
import 'package:meditasyon/view/InfoPage.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  String currentTitle = "";
  String currentCover = "assets/images/img_lotus.png";
  String currentOwner = "";
  IconData btnIcon = Icons.play_arrow_rounded;
  static bool isSelect = false;

  AudioPlayer audioPlayer = new AudioPlayer();
  bool isPlaying = false;
  String currentAudio = "";

  Duration duration = new Duration();
  Duration position = new Duration();

  static List audioList = [
    {
      'title': "Rahatlamak için Nefes Tekniği: 4-7-8",
      'info':
          "   Bu teknikte 4 saniyede burundan derin bir şekilde diyaframı kullanarak nefes alırız, nefesimizi 7 saniye boyunca tutar ve 8 saniyede yavaş yavaş geri veririz.\n\n  Bu teknik meditasyon sırasında kullanılan en önemli nefes tekniklerinden biridir.\n\n  Etkiyi en yüksek düzeyde görmek için, bu nefes tekniğinin 6-8 döngüye kadar yapılması önerilmektedir.\n\n  Bu teknikte de diğer tekniklerde olduğu gibi nefes alma aktif, nefes verme ise pasif bir şekilde yapılmalıdır.",
      'coverImg': "assets/coverImg/img_relax.jpg",
      'owner': "Rahatlama",
    },
    {
      'title': "Sakinleşmek için Nefes Tekniği: 2-4-8",
      'info':
          "   Bu nefes tekniğinde nefesimizi burnumuzdan derin bir şekilde diyaframımızı kullanarak 2 saniyede alır, 4 saniye nefesimizi tutar ve 8 saniyede yavaş yavaş nefesi geri veririz.\n\n  Burada unutulmaması gereken önemli noktalardan biri nefesin derinliğidir diğer önemli nokta ise nefesi verirken içeride hiç nefes kalmadığına dikkat etmektir.\n\n  Bu nefes tekniğini 6-8 döngüye kadar yapabiliriz.\n\n  Nefes alma işlemi aktif, nefes verme işlemi ise daha pasif bir şekilde yapılması gerekmektedir.",
      'coverImg': "assets/coverImg/img_focus.jpg",
      'owner': "Sakinleşme",
    },
    {
      'title': "Sama Vritti (Dengeli Nefes) Tekniği",
      'info':
          "   Stres azaltmanın yanı sıra odaklanma ve dikkat sorunlarını çözmede de çok etkili olan bu nefes tekniği, özellikle çocuklar için meditasyonda sıkça tercih edilir.\n\n  Genellikle dikkat dağınıklığı yaşayan, ders çalışmakta zorlanan ya da Dikkat Eksikliği ve Hiperaktivite Bozukluğu olan çocukların odak sürelerini uzatmak amacıyla meditasyon ile uygulanır.\n\n  Öncelikle nefesinize direnç eklemek için yalnızca burnunuzdan nefes almanız gerektiğini söylememiz gerekiyor. İlk aşamada nefes alırken ve verirken her seferinde 4’e kadar sayın.\n\n  Zamanla bu rakamı daha da yükseltebilirsiniz; ancak belirtmek isteriz ki maksimum 8 saniyeden uzun sürememesine dikkat etmelisiniz.\n\n  Ayrıca bu teknik esnasında saniyelere değil, burnunuzdan vücudunuza dolan havaya odaklanmaya çalışın.",
      'coverImg': "assets/coverImg/img_behappy.jpg",
      'owner': "Odaklanma",
    },
    {
      'title': "Nadi Shodhana (Dengeleyici) Tekniği",
      'info':
          "   Özellikle dinamik meditasyon gibi çok enerji gerektiren meditasyon yöntemleri ile tercih edilen Nadi Shodhana nefesi, bireyi uyarmak ve enerji depolamak amacıyla kullanılır.\n\n  Özellikle çok yoğun günlerin öncesinde uygulayabileceğiniz bu nefes tekniğini, akşamları tercih etmemenizi tavsiye ederiz; çünkü kafein etkisi yaparak uyku düzeninize zarar verebilir.\n\n  Öncelikle rahat bir pozisyona geçin ve zihninizi olabildiği kadar boşaltmaya çalışın. Sonra sağ başparmağınız ile sağ burnunuzu kapatın ve sol burnunuzdan 4 saniyelik derin bir nefes alın.\n\n  Ardından sol başparmağınız ile sol burnunuzu kapatın ve aldığınız nefesi sağ burnunuzdan boşaltın. Aynı işlemi, nefes aldığınız ve verdiğiniz burunları her seferinde değiştirerek tekrarlayın.",
      'coverImg': "assets/coverImg/img_health.jpg",
      'owner': "Enerji",
    },
    {
      'title': "Kaphalabhati Tekniği",
      'info':
          "   Sanal yolları ve ciğerleri temizlemek için tercih edilen bu meditasyon nefesi, aynı zamanda hızlı alınıp verilen bir nefes olduğu için zihinsel rahatlamada çok başarılıdır.\n\n  Yoğun bir günün ardından ya da işte, evde, okulda kısa aralarda rahatlıkla uygulanabilir ve yoğun enerjiden arınmaya yardımcı olur.\n\n  Bu nefes tekniğini uygulamaya başlamadan önce, kaslarınıza tek tek odaklanmalı ve gevşemelerini sağlamanız gerekiyor; çünkü bu nefes tekniğinde yalnızca karın kasları kasılmalıdır.\n\n  Karınla pasif nefes alış ve aktif nefes veriş olarak bilinen bu teknikte uzun ve yavaş bir nefes almanız, sonrasında ise aldığınız nefesi güçlü bir şekilde vermeniz gerekiyor.\n\n  5-10 saniyelik devirler şeklinde yaptığınız bu egzersizler arasında ise ara vermeniz ve normal, derin bir nefes alışverişi yapmanız gerekiyor.",
      'coverImg': "assets/coverImg/img_sleep.jpg",
      'owner': "Rahatlama",
    },
    {
      'title': "Rahatlamak için Nefes Tekniği: 4-7-8",
      'info':
          "   Bu teknikte 4 saniyede burundan derin bir şekilde diyaframı kullanarak nefes alırız, nefesimizi 7 saniye boyunca tutar ve 8 saniyede yavaş yavaş geri veririz.\n\n  Bu teknik meditasyon sırasında kullanılan en önemli nefes tekniklerinden biridir.\n\n  Etkiyi en yüksek düzeyde görmek için, bu nefes tekniğinin 6-8 döngüye kadar yapılması önerilmektedir.\n\n  Bu teknikte de diğer tekniklerde olduğu gibi nefes alma aktif, nefes verme ise pasif bir şekilde yapılmalıdır.",
      'coverImg': "assets/coverImg/img_relax.jpg",
      'owner': "Rahatlama",
    },
    {
      'title': "Sakinleşmek için Nefes Tekniği: 2-4-8",
      'info':
          "   Bu nefes tekniğinde nefesimizi burnumuzdan derin bir şekilde diyaframımızı kullanarak 2 saniyede alır, 4 saniye nefesimizi tutar ve 8 saniyede yavaş yavaş nefesi geri veririz.\n\n  Burada unutulmaması gereken önemli noktalardan biri nefesin derinliğidir diğer önemli nokta ise nefesi verirken içeride hiç nefes kalmadığına dikkat etmektir.\n\n  Bu nefes tekniğini 6-8 döngüye kadar yapabiliriz.\n\n  Nefes alma işlemi aktif, nefes verme işlemi ise daha pasif bir şekilde yapılması gerekmektedir.",
      'coverImg': "assets/coverImg/img_focus.jpg",
      'owner': "Sakinleşme",
    },
    {
      'title': "Sama Vritti (Dengeli Nefes) Tekniği",
      'info':
          "   Stres azaltmanın yanı sıra odaklanma ve dikkat sorunlarını çözmede de çok etkili olan bu nefes tekniği, özellikle çocuklar için meditasyonda sıkça tercih edilir.\n\n  Genellikle dikkat dağınıklığı yaşayan, ders çalışmakta zorlanan ya da Dikkat Eksikliği ve Hiperaktivite Bozukluğu olan çocukların odak sürelerini uzatmak amacıyla meditasyon ile uygulanır.\n\n  Öncelikle nefesinize direnç eklemek için yalnızca burnunuzdan nefes almanız gerektiğini söylememiz gerekiyor. İlk aşamada nefes alırken ve verirken her seferinde 4’e kadar sayın.\n\n  Zamanla bu rakamı daha da yükseltebilirsiniz; ancak belirtmek isteriz ki maksimum 8 saniyeden uzun sürememesine dikkat etmelisiniz.\n\n  Ayrıca bu teknik esnasında saniyelere değil, burnunuzdan vücudunuza dolan havaya odaklanmaya çalışın.",
      'coverImg': "assets/coverImg/img_behappy.jpg",
      'owner': "Odaklanma",
    },
    {
      'title': "Nadi Shodhana (Dengeleyici) Tekniği",
      'info':
          "   Özellikle dinamik meditasyon gibi çok enerji gerektiren meditasyon yöntemleri ile tercih edilen Nadi Shodhana nefesi, bireyi uyarmak ve enerji depolamak amacıyla kullanılır.\n\n  Özellikle çok yoğun günlerin öncesinde uygulayabileceğiniz bu nefes tekniğini, akşamları tercih etmemenizi tavsiye ederiz; çünkü kafein etkisi yaparak uyku düzeninize zarar verebilir.\n\n  Öncelikle rahat bir pozisyona geçin ve zihninizi olabildiği kadar boşaltmaya çalışın. Sonra sağ başparmağınız ile sağ burnunuzu kapatın ve sol burnunuzdan 4 saniyelik derin bir nefes alın.\n\n  Ardından sol başparmağınız ile sol burnunuzu kapatın ve aldığınız nefesi sağ burnunuzdan boşaltın. Aynı işlemi, nefes aldığınız ve verdiğiniz burunları her seferinde değiştirerek tekrarlayın.",
      'coverImg': "assets/coverImg/img_health.jpg",
      'owner': "Enerji",
    },
    {
      'title': "Kaphalabhati Tekniği",
      'info':
          "   Sanal yolları ve ciğerleri temizlemek için tercih edilen bu meditasyon nefesi, aynı zamanda hızlı alınıp verilen bir nefes olduğu için zihinsel rahatlamada çok başarılıdır.\n\n  Yoğun bir günün ardından ya da işte, evde, okulda kısa aralarda rahatlıkla uygulanabilir ve yoğun enerjiden arınmaya yardımcı olur.\n\n  Bu nefes tekniğini uygulamaya başlamadan önce, kaslarınıza tek tek odaklanmalı ve gevşemelerini sağlamanız gerekiyor; çünkü bu nefes tekniğinde yalnızca karın kasları kasılmalıdır.\n\n  Karınla pasif nefes alış ve aktif nefes veriş olarak bilinen bu teknikte uzun ve yavaş bir nefes almanız, sonrasında ise aldığınız nefesi güçlü bir şekilde vermeniz gerekiyor.\n\n  5-10 saniyelik devirler şeklinde yaptığınız bu egzersizler arasında ise ara vermeniz ve normal, derin bir nefes alışverişi yapmanız gerekiyor.",
      'coverImg': "assets/coverImg/img_sleep.jpg",
      'owner': "Rahatlama",
    },
    {
      'title': "Rahatlamak için Nefes Tekniği: 4-7-8",
      'info':
          "   Bu teknikte 4 saniyede burundan derin bir şekilde diyaframı kullanarak nefes alırız, nefesimizi 7 saniye boyunca tutar ve 8 saniyede yavaş yavaş geri veririz.\n\n  Bu teknik meditasyon sırasında kullanılan en önemli nefes tekniklerinden biridir.\n\n  Etkiyi en yüksek düzeyde görmek için, bu nefes tekniğinin 6-8 döngüye kadar yapılması önerilmektedir.\n\n  Bu teknikte de diğer tekniklerde olduğu gibi nefes alma aktif, nefes verme ise pasif bir şekilde yapılmalıdır.",
      'coverImg': "assets/coverImg/img_relax.jpg",
      'owner': "Rahatlama",
    },
    {
      'title': "Sakinleşmek için Nefes Tekniği: 2-4-8",
      'info':
          "   Bu nefes tekniğinde nefesimizi burnumuzdan derin bir şekilde diyaframımızı kullanarak 2 saniyede alır, 4 saniye nefesimizi tutar ve 8 saniyede yavaş yavaş nefesi geri veririz.\n\n  Burada unutulmaması gereken önemli noktalardan biri nefesin derinliğidir diğer önemli nokta ise nefesi verirken içeride hiç nefes kalmadığına dikkat etmektir.\n\n  Bu nefes tekniğini 6-8 döngüye kadar yapabiliriz.\n\n  Nefes alma işlemi aktif, nefes verme işlemi ise daha pasif bir şekilde yapılması gerekmektedir.",
      'coverImg': "assets/coverImg/img_focus.jpg",
      'owner': "Sakinleşme",
    },
    {
      'title': "Sama Vritti (Dengeli Nefes) Tekniği",
      'info':
          "   Stres azaltmanın yanı sıra odaklanma ve dikkat sorunlarını çözmede de çok etkili olan bu nefes tekniği, özellikle çocuklar için meditasyonda sıkça tercih edilir.\n\n  Genellikle dikkat dağınıklığı yaşayan, ders çalışmakta zorlanan ya da Dikkat Eksikliği ve Hiperaktivite Bozukluğu olan çocukların odak sürelerini uzatmak amacıyla meditasyon ile uygulanır.\n\n  Öncelikle nefesinize direnç eklemek için yalnızca burnunuzdan nefes almanız gerektiğini söylememiz gerekiyor. İlk aşamada nefes alırken ve verirken her seferinde 4’e kadar sayın.\n\n  Zamanla bu rakamı daha da yükseltebilirsiniz; ancak belirtmek isteriz ki maksimum 8 saniyeden uzun sürememesine dikkat etmelisiniz.\n\n  Ayrıca bu teknik esnasında saniyelere değil, burnunuzdan vücudunuza dolan havaya odaklanmaya çalışın.",
      'coverImg': "assets/coverImg/img_behappy.jpg",
      'owner': "Odaklanma",
    },
    {
      'title': "Nadi Shodhana (Dengeleyici) Tekniği",
      'info':
          "   Özellikle dinamik meditasyon gibi çok enerji gerektiren meditasyon yöntemleri ile tercih edilen Nadi Shodhana nefesi, bireyi uyarmak ve enerji depolamak amacıyla kullanılır.\n\n  Özellikle çok yoğun günlerin öncesinde uygulayabileceğiniz bu nefes tekniğini, akşamları tercih etmemenizi tavsiye ederiz; çünkü kafein etkisi yaparak uyku düzeninize zarar verebilir.\n\n  Öncelikle rahat bir pozisyona geçin ve zihninizi olabildiği kadar boşaltmaya çalışın. Sonra sağ başparmağınız ile sağ burnunuzu kapatın ve sol burnunuzdan 4 saniyelik derin bir nefes alın.\n\n  Ardından sol başparmağınız ile sol burnunuzu kapatın ve aldığınız nefesi sağ burnunuzdan boşaltın. Aynı işlemi, nefes aldığınız ve verdiğiniz burunları her seferinde değiştirerek tekrarlayın.",
      'coverImg': "assets/coverImg/img_health.jpg",
      'owner': "Enerji",
    },
    {
      'title': "Kaphalabhati Tekniği",
      'info':
          "   Sanal yolları ve ciğerleri temizlemek için tercih edilen bu meditasyon nefesi, aynı zamanda hızlı alınıp verilen bir nefes olduğu için zihinsel rahatlamada çok başarılıdır.\n\n  Yoğun bir günün ardından ya da işte, evde, okulda kısa aralarda rahatlıkla uygulanabilir ve yoğun enerjiden arınmaya yardımcı olur.\n\n  Bu nefes tekniğini uygulamaya başlamadan önce, kaslarınıza tek tek odaklanmalı ve gevşemelerini sağlamanız gerekiyor; çünkü bu nefes tekniğinde yalnızca karın kasları kasılmalıdır.\n\n  Karınla pasif nefes alış ve aktif nefes veriş olarak bilinen bu teknikte uzun ve yavaş bir nefes almanız, sonrasında ise aldığınız nefesi güçlü bir şekilde vermeniz gerekiyor.\n\n  5-10 saniyelik devirler şeklinde yaptığınız bu egzersizler arasında ise ara vermeniz ve normal, derin bir nefes alışverişi yapmanız gerekiyor.",
      'coverImg': "assets/coverImg/img_sleep.jpg",
      'owner': "Rahatlama",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (isPlaying) {
              audioPlayer.pause();
              Navigator.pop(context);
            } else if (!isPlaying) {
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 28,
          ),
          color: Constants.deepPurple,
        ),
        title: Image.asset(
          "assets/images/img_lotus.png",
          height: 42,
        ),
        toolbarHeight: 54,
        backgroundColor: Constants.purple.withOpacity(.15),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: audioList.length,
              itemBuilder: (context, index) => customListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoPageOne(
                            audioList[index]["title"],
                            audioList[index]["info"])),
                  );
                  /* playAudio(audioList[index]['audio']);
                  setState(() {
                    currentTitle = audioList[index]['title'];
                    currentCover = audioList[index]['coverImg'];
                    currentOwner = audioList[index]['owner'];
                  }); */
                },
                title: audioList[index]['title'],
                coverImg: audioList[index]['coverImg'],
                info: audioList[index]['info'],
                owner: audioList[index]['owner'],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InfoPageOne(String infoTitle, String info) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/img_lotus.png",
          height: 42,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Constants.purple,
            size: 30,
          ),
        ),
        toolbarHeight: 54,
        backgroundColor: Constants.purple.withOpacity(.15),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      infoTitle,
                      style: infoTitleTextstyle(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Text(info, style: infoSubTitleTextstyle()),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Constants.purple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Constants.lightPurple),
                      shape:
                          MaterialStateProperty.resolveWith((states) => null),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Constants.purple),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExercisePage()),
                      );
                    },
                    child: Text(
                      'Tekniğe Başla',
                      style: TextStyle(
                          fontSize: 20,
                          color: Constants.white,
                          fontFamily: "hankenB",
                          letterSpacing: 0.25),
                    ))),
          )
        ],
      ),
    );
  }

  TextStyle infoTitleTextstyle() {
    return TextStyle(
        fontSize: 16,
        color: Constants.purple,
        fontFamily: "hankenB",
        letterSpacing: 0);
  }

  TextStyle infoSubTitleTextstyle() {
    return TextStyle(
        fontSize: 14,
        color: Constants.black,
        fontFamily: "hankenM",
        letterSpacing: 0.25);
  }
}



 /* void playAudio(String audioAsset) async {
    final Source assetUrl = AssetSource(audioAsset);
    if (isPlaying && currentAudio != audioAsset) {
      audioPlayer.pause();
      audioPlayer.play(assetUrl);
      setState(() {
        currentAudio = audioAsset;
        print("if");
      });
    } else if (!isPlaying) {
      audioPlayer.play(assetUrl);
      setState(() {
        isPlaying = true;
        print("else if");
        btnIcon = Icons.pause_rounded;
      });
    }
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  } */

/* Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Color.fromRGBO(213, 213, 213, 1), blurRadius: 8)
            ]),
            child: Column(children: [
              Slider.adaptive(
                value: position.inSeconds.toDouble(),
                inactiveColor: Constants.lightPurple.withOpacity(.5),
                min: 0.0,
                max: duration.inSeconds.toDouble(),
                activeColor: Constants.lightPurple,
                thumbColor: Constants.deepPurple,
                onChanged: ((value) {}),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(currentCover),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ralewayM",
                                color: Constants.black),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            currentOwner,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w700,
                                fontFamily: "ralewayM",
                                letterSpacing: 0.75,
                                color: Constants.purple),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 8, bottom: 12),
                      child: IconButton(
                          onPressed: () {
                            if (isPlaying) {
                              audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.play_arrow_rounded;
                                isPlaying = false;
                              });
                            } else {
                              audioPlayer.resume();
                              setState(() {
                                btnIcon = Icons.pause_rounded;
                                isPlaying = true;
                              });
                            }
                          },
                          icon: Icon(
                            btnIcon,
                            size: 44,
                            color: Constants.deepPurple,
                          )),
                    )
                  ],
                ),
              )
            ]),
          ) */