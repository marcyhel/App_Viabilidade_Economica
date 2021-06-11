import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plan3/mobx/mob_dados/mob_dados.dart';
import 'package:plan3/screens/coletaDados/componetnes/imput.dart';
import 'package:plan3/screens/componentes/fade.dart';

class ColetaDados extends StatefulWidget {
  ColetaDados({Key? key}) : super(key: key);

  @override
  State<ColetaDados> createState() => _ColetaDadosState();
}

class _ColetaDadosState extends State<ColetaDados> {
  final Mob_dados mob = GetIt.I<Mob_dados>();
  bool _visible = false;
  bool _visible1 = false;
  bool _visible2 = false;

  int daley = 400;
  int velo = 500;

  var top = 0.0;
  var top2 = 0.0;
  var top3 = 0.0;
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
      backgroundColor: Colors.blueGrey,
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              if (v.metrics.axis != Axis.horizontal) {
                top -= v.scrollDelta! / 2;
                top2 -= v.scrollDelta! / 3;
                top3 -= v.scrollDelta! / 4;
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
                            padding:
                                EdgeInsets.only(left: 20, bottom: 10, top: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "INDICES",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black.withAlpha(170),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Fade(
                              delay: daley + 100,
                              mili: velo,
                              child: CardImput(
                                title: "Ciclo de produção peixe",
                              ),
                            ),
                          ),
                          Fade(
                            delay: daley + 200,
                            mili: velo,
                            child: CardImput(
                              title: "Ciclo de produção alface",
                            ),
                          ),
                          Fade(
                            delay: daley + 300,
                            mili: velo,
                            child: CardImput(
                              title:
                                  "Número de ciclos de produção de peixe/ano",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title:
                                  "Número de ciclos de produção de alface/ano",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Número de peixes/ciclo",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Número de plantas/ciclo",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Unidade comercializada/ciclo de alface",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title:
                                  "Número de produtos comercializado/ciclo de alface",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Unidade comercializada/ciclo de peixe",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title:
                                  "Número de produtos comercializado/ciclo de alface",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Preço de venda peixe",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Preço de venda alface",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 20.0),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 10, bottom: 10, top: 10),
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
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title:
                                  "Custo com Tanque (Caixa) para criação dos Peixes",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Custo com material Hidráulico",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Custo com Material elétrico",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Custo com  material de automação",
                            ),
                          ),
                          Fade(
                            delay: daley + 400,
                            mili: velo,
                            child: CardImput(
                              title: "Custos Fixos Extras",
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
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
