import 'package:flutter/material.dart';
import 'package:meditasyon/constants.dart';
import 'package:meditasyon/view/AudioPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/img_lotus.png",
          height: 42,
        ),
        toolbarHeight: 50,
        backgroundColor: Constants.purple.withOpacity(.15),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Text(
              "Hoşgeldin!\nBugün nasıl hissediyorsun?",
              style: TextStyle(
                  fontSize: 18,
                  color: Constants.purple,
                  fontFamily: "hankenB",
                  letterSpacing: 0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              "Kategoriler",
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.black,
                  fontFamily: "hankenM",
                  letterSpacing: 0.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              categoryCard(h, w, "assets/images/img_yoga.png", "Rahatla",
                  "Sakinleşmek, kalbini duymanı sağlar."),
              categoryCard(h, w, "assets/images/img_focus.png", "Odaklan",
                  "Başarı odaklanmakla başlar"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              categoryCard(h, w, "assets/images/img_happy.png", "Gülümse",
                  "Gülmek mutluluğun anahtarıdır."),
              categoryCard(h, w, "assets/images/img_health.png", "Sağlıklı Kal",
                  "Hayattaki en değerli varlık sağlıktır."),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              categoryCard(h, w, "assets/images/img_sleep.png", "Uykuya Dal",
                  "Uyku; zihin için yaşam kaynağıdır."),
              categoryCard(h, w, "assets/images/img_love.png", "Kendini Sev",
                  "Kendini sevmek, başlangıçtır."),
            ],
          ),
        ],
      ),
    );
  }

  categoryCard(
      double h, double w, String imageText, String title, String subtitle) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AudioPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: h / 5,
          width: w / 2.3,
          decoration: BoxDecoration(
            /* border: Border.all(
              color: Constants.purple.withOpacity(.2),
              width: 0.5,
            ), */
            borderRadius: BorderRadius.circular(20),
            color: Constants.purple.withOpacity(.12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Image.asset(
                  imageText,
                  height: 40,
                  color: Constants.purple,
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  bottom: 4,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.black,
                      fontFamily: "hankenB",
                      letterSpacing: 0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12, right: 4),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Constants.purple.withOpacity(1),
                    fontFamily: "hankenM",
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
