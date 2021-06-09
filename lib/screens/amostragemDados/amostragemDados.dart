import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plan3/mobx/mob_dados/mob_dados.dart';
import 'package:plan3/screens/amostragemDados/componente/cards.dart';
import 'package:plan3/screens/amostragemDados/componente/grafico.dart';
import 'package:plan3/screens/amostragemDados/componente/tileText.dart';

class AmostragemDados extends StatefulWidget {
  @override
  _AmostragemDadosState createState() => _AmostragemDadosState();
}

class _AmostragemDadosState extends State<AmostragemDados> {
  final Mob_dados mob = GetIt.I<Mob_dados>();
  var top = 0.0;
  var top2 = 0.0;
  double actualHeight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              if (v.metrics.axis != Axis.horizontal) {
                top -= v.scrollDelta! / 2;
                top2 -= v.scrollDelta! / 3;
              }
            });
          }

          return true;
        },
        child: LayoutBuilder(builder: (ctx, constraints) {
          double tempHeight = constraints.maxHeight + 500;

          actualHeight = tempHeight;
          return Stack(
            children: [
              Positioned(
                left: -50,
                top: top2,
                child: Container(
                  margin: EdgeInsets.only(left: 0, top: 80),
                  height: 150,
                  child: Image.asset(
                    'image/alga.png',
                    fit: BoxFit.fill,
                    color: Colors.blueGrey[700],
                    //colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Positioned(
                top: top2 * 1.2,
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 120),
                  height: 150,
                  child: Image.asset(
                    'image/alga.png',
                    fit: BoxFit.fill,
                    color: Colors.blueGrey[700],
                    //colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Positioned(
                top: top2,
                right: -50,
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 130,
                  child: Image.asset(
                    'image/alface.png',
                    fit: BoxFit.fill,
                    color: Colors.blueGrey[700],
                    //colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Positioned(
                top: top,
                child: Container(
                  margin: EdgeInsets.only(left: 50, top: 70),
                  height: 100,
                  child: Image.asset(
                    'image/fish.png',
                    fit: BoxFit.fill,
                    color: Colors.teal[100],
                    //colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Positioned(
                top: -50 + (top * 1.3),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: 0,
                  ),
                  height: MediaQuery.of(context).size.width / 2.1,
                  child: Image.asset(
                    'image/bolhas.png',
                    fit: BoxFit.fill,
                    color: Colors.blueGrey[300],
                    //colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Observer(builder: (_) {
                return ListView(
                  children: [
                    Container(
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
                              )),
                          TileText(valor: "Investimento Inicial"),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 20.0),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 20, bottom: 0, top: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "PEIXES",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black.withAlpha(170),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...mob.anos_Peixe.map((item) {
                                  return Cards(ano: item.ano);
                                }).toList(),
                                Cards(),
                                Cards(),
                                Cards(),
                                Cards(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 20.0),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 20, bottom: 0, top: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "ALFACES",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black.withAlpha(170),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...mob.anos_Peixe.map((item) {
                                  return Cards(ano: item.ano);
                                }).toList(),
                                Cards(),
                                Cards(),
                                Cards(),
                                Cards(),
                              ],
                            ),
                          ),
                          Grafico(dados: mob.dados_grafico),
                          GestureDetector(
                            onTap: mob.random,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              color: Colors.blue,
                              child: Text("Random()"),
                            ),
                          ),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                          TileText(valor: "Investimento Inicial"),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
