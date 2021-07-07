import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:plan3/screens/componentes/fade.dart';

import 'componente/paralax.dart';

class SobreNos extends StatefulWidget {
  SobreNos({Key? key}) : super(key: key);

  @override
  State<SobreNos> createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  bool _visible = false;
  bool _visible1 = false;
  bool _visible2 = false;
  int daley = 400;
  int velo = 500;
  var top = -30.0;
  var top2 = -30.0;
  var top3 = -30.0;
  double actualHeight = 0;
  void fadess() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _visible = !_visible;
    });
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _visible1 = !_visible1;
    });
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _visible2 = !_visible2;
    });
  }

  @override
  void initState() {
    fadess();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = new ScrollController();
    return Scaffold(
      backgroundColor: Color(0xff063943),
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              if (v.metrics.axis != Axis.horizontal) {
                top -= v.scrollDelta! / 2;
                top2 -= v.scrollDelta! / 3;
                top3 -= v.scrollDelta! / 5;
              }
            });
          }

          return true;
        },
        child: LayoutBuilder(builder: (ctx, constraints) {
          double tempHeight = constraints.maxHeight + 500;

          actualHeight = tempHeight;
          return Stack(children: <Widget>[
            Positioned(
              top: top - 150,
              left: 0,
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('image/one.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              top: top2 - 200,
              left: 0,
              child: AnimatedOpacity(
                opacity: _visible1 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('image/one.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Positioned(
              top: top3 - 250,
              left: 0,
              child: AnimatedOpacity(
                opacity: _visible2 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('image/one.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            ListView(controller: controller, children: [
              Fade(
                delay: 700,
                mili: 500,
                child: Container(
                  margin: EdgeInsets.only(top: 200),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 7,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "CUSTO FIXO",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black.withAlpha(170),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/pexe.jpeg',
                        alt: 200,
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/pexe.jpeg',
                        alt: 200,
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/mato.jpeg',
                        alt: 200,
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/pexe.jpeg',
                        alt: 200,
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/party.jpeg',
                        alt: 200,
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/pexe.jpeg',
                        alt: 200,
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/pexe.jpeg',
                        alt: 200,
                      ),
                      ParalaImagem(
                        controller: controller,
                        img: 'image/pexe.jpeg',
                        alt: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ]);
        }),
      ),
    );
  }
}
