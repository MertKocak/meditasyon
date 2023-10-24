import 'package:flutter/material.dart';
import 'package:meditasyon/constants.dart';
import 'package:meditasyon/view/ExercisePage.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return InfoPageOne("Rahatlamak için Nefes Tekniği: 4-7-8");
  }

  Scaffold InfoPageOne(String infoTitle) {
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      infoTitle,
                      textAlign: TextAlign.left,
                      style: infoTitleTextstyle(),
                    ),
                    Text(
                        "\n  Bu teknikte 4 saniyede burundan derin bir şekilde diyaframı kullanarak nefes alırız, nefesimizi 7 saniye boyunca tutar ve 8 saniyede yavaş yavaş geri veririz.\n\n  Bu teknik meditasyon sırasında kullanılan en önemli nefes tekniklerinden biridir.\n\n  Etkiyi en yüksek düzeyde görmek için, bu nefes tekniğinin 6-8 döngüye kadar yapılması önerilmektedir.\n\n  Bu teknikte de diğer tekniklerde olduğu gibi nefes alma aktif, nefes verme ise pasif bir şekilde yapılmalıdır.",
                        style: infoSubTitleTextstyle()),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Constants.purple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))),
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Constants.purple;
                          if (states.contains(MaterialState.pressed))
                            return Constants.lightPurple;
                          return null; // Defer to the widget's default.
                        },
                      ),
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
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Constants.white,
                          fontFamily: "hankenM",
                          letterSpacing: 1),
                    ))),
          )
        ],
      ),
    );
  }

  TextStyle infoTitleTextstyle() {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Constants.purple,
        fontFamily: "hankenM",
        letterSpacing: 1);
  }

  TextStyle infoSubTitleTextstyle() {
    return TextStyle(
        fontSize: 14,
        color: Constants.black,
        fontFamily: "hankenM",
        letterSpacing: 1);
  }
}
