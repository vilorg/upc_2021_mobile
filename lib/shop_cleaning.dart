import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCleaning extends StatefulWidget {
  const ShopCleaning({Key? key}) : super(key: key);

  @override
  State<ShopCleaning> createState() => _ShopCleaningState();
}

class _ShopCleaningState extends State<ShopCleaning> {
  bool _selectedActual = true;

  var text = Container(child: Column(children: const <Widget>[
    Text("Закажите уборку"),
    Text("Пришлем проверенного клинера и наведем порядок в вашем доме")
  ],));

  void _onOrderItemTapped() {
    setState(() {
      _selectedActual = !_selectedActual;
    });
  }

  @override
  Widget build(BuildContext context) {
    var shopCleaning = Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/aunt.png"), fit: BoxFit.cover)),
      child: Container(
        child: Column(
          children: [
            text,
            Row(children: const [
              Icon(Icons.flash_on),
              Text("от 650 ₽")
            ],),
            TextButton(onPressed: () {},
              child: const Text("Заказать уборку"),
              )
          ],
        ),
      ),
    );

    var selectOrder = SizedBox(
      child: Row(
        children: [
          Column(
            children: [
              const Text("Актуальные"),
              Container(
                width: 100,
                height: 10,
                color: const Color.fromRGBO(54, 86, 249, 1),
              ),
              const Text("Выполненные")
            ],
          )
        ],
      ),
    );

    return Container();
  }
}