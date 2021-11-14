import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:upc_2022/shopCleaning/other.dart';

class TellUs extends StatefulWidget {
  const TellUs({Key? key}) : super(key: key);

  @override
  State<TellUs> createState() => _TellUsState();
}

class _TellUsState extends State<TellUs> {
  Color primaryColor = const Color.fromRGBO(54, 86, 249, 1);
  Color bordColor = const Color.fromRGBO(202, 114, 33, 1);
  Color backNotSelectedColor = const Color.fromRGBO(237, 240, 255, 1);

  int indexesRoom = -1;
  int indexesBath = -1;

  Container getButton({isStr, widget, size, def, selected}) {
    double opacity = 1;
    if (!def && !selected) {
      opacity = 0.5;
    }

    TextStyle textStyleDsbBtn = TextStyle(
        color: const Color.fromRGBO(54, 86, 249, 1).withOpacity(opacity),
        fontFamily: "Montserrat bold",
        fontSize: 18);
    TextStyle textStyleEnbBtn = TextStyle(
        color: Colors.white.withOpacity(opacity),
        fontFamily: "Montserrat bold",
        fontSize: 18);

    return Container(
      height: size,
      width: size,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (selected
              ? const Color.fromRGBO(54, 86, 249, 1).withOpacity(opacity)
              : const Color.fromRGBO(237, 240, 255, 1).withOpacity(opacity)),
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10)),
      child: (isStr
          ? Text(
              widget,
              style: (selected ? textStyleEnbBtn : textStyleDsbBtn),
            )
          : const Icon(Icons.arrow_back_ios_new,
              color: Color.fromRGBO(54, 86, 249, 1))),
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4 - 30;
    List<GestureDetector> arrRoom = [];
    List<GestureDetector> arrBath = [];

    for (int i = 1; i < 5; i++) {
      arrRoom.add(
        GestureDetector(
            child: getButton(
                isStr: true,
                widget: "$i",
                size: size,
                def: indexesRoom == -1,
                selected: indexesRoom == i),
            onTap: () => setState(() {
                  indexesRoom = i;
                })),
      );
      arrBath.add(
        GestureDetector(
            child: getButton(
                isStr: true,
                widget: "$i",
                size: size,
                def: indexesBath == -1,
                selected: indexesBath == i),
            onTap: () => setState(() {
                  indexesBath = i;
                })),
      );
    }

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
          InkWell(
            child: getButton(
                isStr: false, size: 60.toDouble(), selected: false, def: true),
            onTap: () => Navigator.pop(context),
          ),
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

    var text = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    children: arrRoom)))
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
                mainAxisAlignment: MainAxisAlignment.center, children: arrBath))
      ]))
    ]);

    Container bottom = Container(
      height: 50,
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.95),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: const [
          Text("≈ 3 Часа",
              style: TextStyle(
                  color: Color.fromRGBO(212, 219, 255, 1),
                  fontFamily: "Montserrat medium")),
          SizedBox(width: 40),
          Text("Далее",
              style: TextStyle(
                  color: Color.fromRGBO(243, 243, 243, 1),
                  fontFamily: "Montserrat medium",
                  fontWeight: FontWeight.bold)),
          SizedBox(width: 40),
          Text("650 ₽",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: "Montserrat medium"))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );

    return Scaffold(
        body: Stack(children: [
      ListView(physics: const BouncingScrollPhysics(), children: [
        top,
        const SizedBox(height: 40),
        text,
        const SizedBox(height: 80)
      ]),
      Align(
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: indexesBath != -1 && indexesRoom != -1,
            child: GestureDetector(
                child: bottom,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OtherThings(indexesRoom, indexesBath)))),
          ))
    ]));
  }
}
