import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TellUs extends StatefulWidget {
  const TellUs({Key? key}) : super(key: key);

  @override
  State<TellUs> createState() => _TellUsState();
}

class _TellUsState extends State<TellUs> {
  Color primaryColor = const Color.fromRGBO(54, 86, 249, 1);
  Color bordColor = const Color.fromRGBO(202, 114, 33, 1);
  Color backNotSelectedColor = const Color.fromRGBO(237, 240, 255, 1);

  TextStyle textStyleBtn = const TextStyle(
      color: Color.fromRGBO(54, 86, 249, 1),
      fontFamily: "Montserrat bold",
      fontSize: 18);

  Container getButton(Widget widget, Color color, double size) {
    return Container(
      height: size,
      width: size,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10)),
      child: widget,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4 - 40;

    var top = Container(
      height: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/room.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter)),
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          getButton(Icon(Icons.arrow_back_ios, color: primaryColor),
              backNotSelectedColor, 60),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width - 120,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 242, 230, 1),
                border:
                    Border.all(color: const Color.fromRGBO(255, 242, 230, 1)),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/price.png",
                  height: 20,
                ),
                const SizedBox(width: 20),
                Text("Ввести промокод", style: TextStyle(color: bordColor))
              ],
            ),
          )
        ],
      ),
    );

    var text = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Расскажите о вашей квартире",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Montserrat medium",
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(53, 55, 62, 1),
                fontSize: 25)),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            child: Column(children: [
          const Text(
            "Количество комнат",
            style: TextStyle(
                fontFamily: "Montserrat medium", fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Center(
              child: SizedBox(
                  height: size + 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getButton(Text("1", style: textStyleBtn),
                          backNotSelectedColor, size),
                      getButton(Text("2", style: textStyleBtn),
                          backNotSelectedColor, size),
                      getButton(Text("3", style: textStyleBtn),
                          backNotSelectedColor, size),
                      getButton(Text("4", style: textStyleBtn),
                          backNotSelectedColor, size),
                    ],
                  )))
        ])),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: Column(children: [
            const Text(
              "Санузлов",
              style: TextStyle(
                  fontFamily: "Montserrat medium", fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            SizedBox(
                height: size + 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getButton(Text("1", style: textStyleBtn),
                        backNotSelectedColor, size),
                    getButton(Text("2", style: textStyleBtn),
                        backNotSelectedColor, size),
                    getButton(Text("3", style: textStyleBtn),
                        backNotSelectedColor, size),
                    getButton(Text("4", style: textStyleBtn),
                        backNotSelectedColor, size),
                  ],
                ))
          ]),
        )
      ],
    );

    return Scaffold(
        body: SafeArea(
            child: ListView(children: [
      top,
      const SizedBox(
        height: 40,
      ),
      text
    ])));
  }
}
