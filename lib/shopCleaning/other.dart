import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'address.dart';

class OtherThings extends StatefulWidget {
  int lenRooms;
  int lenBaths;

  OtherThings(this.lenRooms, this.lenBaths, {Key? key}) : super(key: key);

  @override
  State<OtherThings> createState() => _OtherThingsState();
}

class _OtherThingsState extends State<OtherThings> {
  int total = 650.toInt();
  double time = 3;
  Color primaryColor = const Color.fromRGBO(54, 86, 249, 1);
  Color bordColor = const Color.fromRGBO(202, 114, 33, 1);

  var items = [
    [
      "Кухня",
      [
        [
          "Помыть плиту",
          "assets/images/things/skovoroda.png",
          320,
          1 / 3,
          false
        ],
        [
          "Помыть внутри микроволновки",
          "assets/images/things/mikrovolnovka.png",
          120,
          1 / 3,
          false
        ],
        [
          "Помыть плиту",
          "assets/images/things/skovoroda.png",
          320,
          1 / 3,
          false
        ],
        [
          "Помыть внутри микроволновки",
          "assets/images/things/mikrovolnovka.png",
          120,
          1 / 3,
          false
        ],
      ]
    ],
    [
      "Санузел",
      [
        ["Помыть ванну", "assets/images/things/vanna.png", 320, 1 / 4, false],
        [
          "Убрать накипь",
          "assets/images/things/wash_machine.png",
          800,
          32 / 60,
          false
        ],
        ["Помыть ванну", "assets/images/things/vanna.png", 320, 1 / 4, false],
        [
          "Убрать накипь",
          "assets/images/things/wash_machine.png",
          800,
          32 / 60,
          false
        ],
      ]
    ],
    [
      "Кухня",
      [
        [
          "Помыть плиту",
          "assets/images/things/skovoroda.png",
          320,
          1 / 3,
          false
        ],
        [
          "Помыть внутри микроволновки",
          "assets/images/things/mikrovolnovka.png",
          120,
          1 / 3,
          false
        ],
        [
          "Помыть плиту",
          "assets/images/things/skovoroda.png",
          320,
          1 / 3,
          false
        ],
        [
          "Помыть внутри микроволновки",
          "assets/images/things/mikrovolnovka.png",
          120,
          1 / 3,
          false
        ],
      ]
    ],
    [
      "Санузел",
      [
        ["Помыть ванну", "assets/images/things/vanna.png", 320, 1 / 4, false],
        [
          "Убрать накипь",
          "assets/images/things/wash_machine.png",
          800,
          32 / 60,
          false
        ],
        ["Помыть ванну", "assets/images/things/vanna.png", 320, 1 / 4, false],
        [
          "Убрать накипь",
          "assets/images/things/wash_machine.png",
          800,
          32 / 60,
          false
        ],
      ]
    ],
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];

    for (List i in items) {
      if (i[0] == "Химчистка одежды") {
        continue;
      }

      String name = i[0];
      List<GestureDetector> listItems = [];

      for (List j in i[1]) {
        bool selected = j[4];
        GestureDetector item = GestureDetector(
          onTap: () => setState(() {
            if (selected == false) {
              total += j[2] as int;
              time += j[3];
            } else {
              total -= j[2] as int;
              time -= j[3];
            }
            j[4] = !selected;
          }),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: (selected
                    ? const Color.fromRGBO(255, 242, 230, 1)
                    : Colors.white),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26)),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  child: Stack(children: [
                    SizedBox(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: (selected
                            ? Image.asset("assets/images/icons/radioSlc.png",
                                width: 15, height: 15)
                            : Image.asset("assets/images/icons/radioNotSlc.png",
                                width: 15, height: 15)),
                      ),
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image(
                          image: AssetImage(j[1]),
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ]),
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 150,
                        height: 50,
                        child: Center(
                          child: Text(j[0],
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Montserrat medium",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        )),
                    const Icon(Icons.info,
                        color: Color.fromRGBO(203, 190, 178, 1))
                  ],
                ),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(254, 151, 57, 1)),
                      child: Text(
                        "${j[2]} ₽",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(width: 10),
                  Text("${(j[3] * 60).toInt()} мин.",
                      style: TextStyle(color: Colors.grey.shade400))
                ])
              ],
            ),
          ),
        );
        listItems.add(item);
      }

      data.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: "Montserrat medium"))),
          SizedBox(
              height: 240,
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: listItems,
                  scrollDirection: Axis.horizontal))
        ],
      ));
    }

    Text text = const Text("Дополнительные услуги",
        style: TextStyle(fontSize: 22, fontFamily: "Montserrat bold"),
        textAlign: TextAlign.center);

    Container top = Container(
        margin: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Color.fromRGBO(54, 86, 249, 1)),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: const [
                          Text(
                            "Стандартная уборка",
                            style: TextStyle(
                                fontFamily: "Montserrat medium",
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.info,
                              color: Color.fromRGBO(54, 86, 249, 1))
                        ]),
                        const SizedBox(height: 5),
                        Text(
                            (widget.lenRooms == 1
                                    ? "${widget.lenRooms} Комната, "
                                    : "${widget.lenRooms} Комнаты, ") +
                                (widget.lenBaths == 1
                                    ? "${widget.lenBaths} Санузел"
                                    : "${widget.lenBaths} Санузла"),
                            style: TextStyle(color: Colors.grey.shade600))
                      ])
                ]),
            const SizedBox(height: 30),
            text
          ],
        ));

    Container bottom = Container(
      height: 50,
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.95),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text("≈ ${time.toStringAsFixed(1)} Часа",
              style: const TextStyle(
                  color: Color.fromRGBO(212, 219, 255, 1),
                  fontFamily: "Montserrat medium")),
          const SizedBox(width: 40),
          const Text("Далее",
              style: TextStyle(
                  color: Color.fromRGBO(243, 243, 243, 1),
                  fontFamily: "Montserrat medium",
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 40),
          Text("$total ₽",
              style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: "Montserrat medium"))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );

    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      ListView(children: [
        top,
        const SizedBox(height: 10),
        Column(children: data),
        const SizedBox(height: 70)
      ], physics: const BouncingScrollPhysics()),
      Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            child: bottom,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Address(
                        widget.lenRooms, widget.lenBaths, time.ceil(), total))),
          ))
    ])));
  }
}
