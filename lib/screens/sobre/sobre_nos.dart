import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:plan3/screens/componentes/fade.dart';
import 'package:plan3/screens/sobre/componente/paragrafo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plan3/mobx/mob_dados/mob_dados.dart';
import 'package:plan3/screens/coletaDados/componetnes/imput.dart';
import 'package:plan3/screens/componentes/fade.dart';
import 'componente/imag.dart';
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
          return Stack(
            children: <Widget>[
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
                          image: AssetImage('image/one.png'),
                          fit: BoxFit.cover),
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
              ListView(
                children: [
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
                      child: Observer(builder: (_) {
                        return Column(
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
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              child: Text(
                                " O software permite ao produtor fazer uma avaliação econômica de um projeto de aquaponia, especificamente na produção de hortaliças e peixes. O aplicativo comunica a viabilidade econômica do projeto em relação ao i) valor/riqueza que o projeto gera; ii) à taxa de retorno obtida no investimento, e; iii) o prazo de recuperação do capital investido. \nEspecificamente, o software permitirá ao produtor:",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Paragrafo(),
                            Imag(img: "image/party.jpeg"),
                            SizedBox(height: 100),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
