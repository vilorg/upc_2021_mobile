import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> have;
  late Future<int> total;

  @override
  void initState() {
    super.initState();
    have = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('have') ?? false);
    });
    total = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('total') ?? 0);
    });
  }

  createTab(int i) {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, bottom: 300, top: 90),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text("Заказ #12331",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("$i ₽",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ]),
          const SizedBox(height: 10),
          Text("Екатеринбург, улица крестинского, д 50, корп 1, кв. 41",
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 17,
                  fontFamily: "Montserrat medium")),
          const SizedBox(height: 30),
          Row(children: [
            Row(
              children: const [
                Icon(Icons.lock_clock_rounded,
                    color: Color.fromRGBO(54, 86, 249, 1), size: 50),
                SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: Text(
                    "Поиск клинера",
                    style: TextStyle(
                        color: Color.fromRGBO(54, 86, 249, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(237, 240, 255, 1)),
                child: const Center(
                    child: Text("Подробнее",
                        style:
                            TextStyle(color: Color.fromRGBO(54, 86, 249, 1)))))
          ])
        ],
      ),
    );
  }

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
            body: TabBarView(children: <Widget>[
              FutureBuilder<bool>(
                  future: have,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data == true) {
                          return FutureBuilder(
                              future: total,
                              builder: (BuildContext context,
                                  AsyncSnapshot<int> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                  case ConnectionState.waiting:
                                    return const CircularProgressIndicator();
                                  default:
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    return createTab(snapshot.data as int);
                                }
                              });
                        }
                    }
                    return shopCleaning;
                  }),
              shopCleaning
            ])));

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
