import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_2022/shopCleaning/tell_us.dart';

class ShopCleaning extends StatefulWidget {
  const ShopCleaning({Key? key}) : super(key: key);

  @override
  State<ShopCleaning> createState() => _ShopCleaningState();
}

class _ShopCleaningState extends State<ShopCleaning> {
  Color primaryColor = const Color.fromRGBO(54, 86, 249, 1);
  Color notPrimaryColor = const Color.fromRGBO(147, 151, 174, 1);

  @override
  Widget build(BuildContext context) {
    var text = Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              "Закажите уборку",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat medium",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text("Пришлем проверенного клинера и наведем порядок в вашем доме",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat medium",
                  color: notPrimaryColor,
                ))
          ],
        ));

    var shopCleaning = Container(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.3,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/aunt.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(
                50, 120 + MediaQuery.of(context).size.height / 5, 50, 30),
            child: ListView(
              children: [
                text,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.flash_on,
                      color: Colors.orange,
                    ),
                    Text(
                      "от 650 ₽",
                      style: TextStyle(
                          fontFamily: "Montserrat medium",
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TellUs()));
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Заказать уборку",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(width: 7),
                        Icon(
                          Icons.arrow_back_ios_outlined,
                          textDirection: TextDirection.rtl,
                          size: 10,
                        )
                      ]),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      alignment: Alignment.center,
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 50))),
                )
              ],
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10));

    var selectOrder = DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 0,
              bottom: TabBar(
                indicator: RectTabIndicator(color: primaryColor, length: 20),
                tabs: [
                  Tab(
                      child: Text(
                    'Актуальные',
                    style: TextStyle(
                        color: primaryColor,
                        fontFamily: "Montserrat medium",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                  Tab(
                    child: Text("Выполненные",
                        style: TextStyle(
                            color: primaryColor,
                            fontFamily: "Montserrat medium",
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            body: TabBarView(children: <Widget>[shopCleaning, shopCleaning])));

    return selectOrder;
  }
}

class RectTabIndicator extends Decoration {
  final BoxPainter _painter;

  RectTabIndicator({required Color color, required double length})
      : _painter = _RectPainter(color, length);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RectPainter extends BoxPainter {
  final Paint _paint;
  final double length;

  _RectPainter(Color color, this.length)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - 11);
    Rect rect = Rect.fromCenter(center: circleOffset, width: length, height: 5);
    RRect rRect = RRect.fromRectAndRadius(rect, const Radius.circular(10));
    canvas.drawRRect(rRect, _paint);
  }
}
