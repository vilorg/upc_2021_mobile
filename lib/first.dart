import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_2022/test.dart';

import 'main_page.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  FirstState createState() => FirstState();
}

class FirstState extends State<First> {
  int cur = 0;

  Container getFirstWindow(Color color, Color textH1, Color textH2,
      String people, String imageBtn, String h1, String h2) {
    var mainImage = SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 4 / 7,
        child: Image.asset(people, fit: BoxFit.fitWidth));

    var text = SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 2 / 7,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            h1,
            style: TextStyle(
                color: textH1,
                fontSize: MediaQuery.of(context).size.height/24,
                fontFamily: "Montserrat bold",
                height: 1.2),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10, width: MediaQuery.of(context).size.width),
          Text(h2,
              style: TextStyle(
                  color: textH2,
                  fontSize: MediaQuery.of(context).size.height/50,
                  fontFamily: "Montserrat normal",
                  fontWeight: FontWeight.bold,
                  height: 1.5),
              textAlign: TextAlign.center)
        ],
      ),
    );

    var btnImage = SizedBox(
      child: InkWell(
          onTap: () {
            setState(() {
              cur++;
            });
          },
          child: Image.asset(imageBtn)),
      height: MediaQuery.of(context).size.height * 2 / 21,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      color: color,
      child: Column(
        children: [mainImage, text, btnImage],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (cur == 3) {
      return const MainPage();
    }

    var firstWindow = getFirstWindow(
        const Color.fromRGBO(54, 86, 249, 1),
        Colors.white,
        const Color.fromRGBO(220, 224, 242, 1),
        "assets/images/auntBlue.png",
        "assets/images/btnWhite.png",
        "Блестящее качество",
        "Наши клинеры - настоящие мастера своего дела, а используемые нами материалы сертифицированны и безопасны");

    var secondWindow = getFirstWindow(
        Colors.white,
        const Color.fromRGBO(65, 65, 69, 1),
        const Color.fromRGBO(77, 86, 136, 1),
        "assets/images/uncle1.png",
        "assets/images/btnBlue.png",
        "Эко-френдли клининг",
        "После каждой уборки мы забираем ваш мусор, сортируем его и увозим на специализированные свалки.");

    var thirdWindow = getFirstWindow(
        Colors.white,
        const Color.fromRGBO(53, 52, 51, 1.0),
        const Color.fromRGBO(143, 140, 138, 1),
        "assets/images/uncle2.png",
        "assets/images/btnOrange.png",
        "Небывалая доступность",
        "Клининг никогда не был таким доступным. Вы можете заказывать уборку несколько раз в месяц");

    List widgets = [firstWindow, secondWindow, thirdWindow];

    print(MediaQuery.of(context).size.height.toString());
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: widgets[cur],
    );
  }
}
