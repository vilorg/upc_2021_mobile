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
  late double paddingImage, paddingShow, fontFormat;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale =
        MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    if (scale > 1.8) {
      paddingImage = height / 2.6;
      paddingShow = height / 20;
      fontFormat = 1.2;
    } else {
      paddingImage = height / 2.3;
      paddingShow = height / 30;
      fontFormat = 1;
    }
    var text = Container(
        padding: EdgeInsets.only(bottom: paddingShow),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Закажите уборку",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat medium",
                  fontWeight: FontWeight.bold,
                  fontSize: 20 * fontFormat),
            ),
            const SizedBox(height: 10),
            Text("Пришлем проверенного клинера и наведем порядок в вашем доме",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13 * fontFormat,
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
            margin: EdgeInsets.fromLTRB(50, paddingImage, 50, 30),
            child: ListView(
              children: [
                text,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flash_on,
                      color: Colors.orange,
                      size: 15 * fontFormat,
                    ),
                    Text(
                      "от 650 ₽",
                      style: TextStyle(
                          fontFamily: "Montserrat medium",
                          fontSize: 15 * fontFormat,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
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
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          alignment: Alignment.center,
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 50))),
                    ))
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
