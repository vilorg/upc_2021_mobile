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

  @override
  Widget build(BuildContext context) {
    var top = Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/room.png"),
              fit: BoxFit.fitWidth)),
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 240, 255, 1.0),
                  border: Border.all(
                      color: const Color.fromRGBO(237, 240, 255, 1.0)),
              borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.arrow_back_ios_outlined, color: primaryColor)),
          Container(
            height: 60,
            width: 200,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 242, 230, 1),
                border: Border.all(
                    color: const Color.fromRGBO(255, 242, 230, 1)),
            borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.asset("assets/images/price.png", height: 20,),
                Text("Ввести промокод", style: TextStyle(color: bordColor))
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(body: SafeArea(child: top));
  }
}
