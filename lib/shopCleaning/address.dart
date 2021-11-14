import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upc_2022/main_page.dart';

class Address extends StatefulWidget {
  int lenRooms, lenBaths, time, total;

  Address(this.lenRooms, this.lenBaths, this.time, this.total, {Key? key})
      : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    Row text =
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
      Text("Адрес",
          style: TextStyle(
              color: Color.fromRGBO(198, 201, 223, 1),
              fontSize: 17,
              fontFamily: "Montserrat medium",
              fontWeight: FontWeight.bold)),
      Text("Время",
          style: TextStyle(
              color: Color.fromRGBO(198, 201, 223, 1),
              fontSize: 17,
              fontFamily: "Montserrat medium",
              fontWeight: FontWeight.bold)),
      Text("Оплата",
          style: TextStyle(
              color: Color.fromRGBO(54, 86, 249, 1),
              fontSize: 17,
              fontFamily: "Montserrat medium",
              fontWeight: FontWeight.bold))
    ]);

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
                                    ? "${widget.lenBaths} Санузел "
                                    : "${widget.lenBaths} Санузла ") +
                                (widget.time == 1
                                    ? "${widget.time} Час "
                                    : "${widget.time} Часа ") +
                                "${widget.total} ₽",
                            style: TextStyle(color: Colors.grey.shade600))
                      ])
                ]),
            const SizedBox(height: 30),
            text
          ],
        ));

    Column data = Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: const Text("Выберите способ оплаты",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 20),
      InkWell(
        onTap: () {
          _prefs.then((SharedPreferences prefs) {
            prefs.setInt("total", widget.total);
            prefs.setBool("have", true);
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        },
        child: Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(237, 240, 255, 1)),
            child: const Center(
              child: Text("Наличными клинеру",
                  style: TextStyle(
                      color: Color.fromRGBO(54, 86, 249, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
            )),
      ),
      InkWell(
        onTap: () {
          _prefs.then((SharedPreferences prefs) {
            prefs.setInt("total", widget.total);
            prefs.setBool("have", true);
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        },
        child: Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(237, 240, 255, 1)),
            child: const Center(
              child: Text("Картой клинеру",
                  style: TextStyle(
                      color: Color.fromRGBO(54, 86, 249, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
            )),
      ),
      const SizedBox(height: 20),
      const Text(
        "Или",
        style: TextStyle(color: Color.fromRGBO(160, 164, 193, 1), fontSize: 17),
      ),
      const SizedBox(height: 20),
      InkWell(
        onTap: () {
          _prefs.then((SharedPreferences prefs) {
            prefs.setInt("total", widget.total);
            prefs.setBool("have", true);
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        },
        child: Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/images/apple.png"),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(0, 0, 0, 1.0))),
      ),
      InkWell(
        onTap: () {
          _prefs.then((SharedPreferences prefs) {
            prefs.setInt("total", widget.total);
            prefs.setBool("have", true);
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        },
        child: Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/images/google.png"),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(0, 0, 0, 1.0))),
      ),
    ]);

    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [top, data],
    )));
  }
}
