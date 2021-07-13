import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plan3/mobx/mob_dados/mob_dados.dart';
import 'package:plan3/screens/amostragemDados/componente/cardGeral.dart';
import 'package:plan3/screens/amostragemDados/componente/cards.dart';
import 'package:plan3/screens/amostragemDados/componente/grafico.dart';
import 'package:plan3/screens/amostragemDados/componente/tileText.dart';
import 'package:plan3/screens/componentes/fade.dart';

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
                top: -10 + top2 / 3,
                left: -10,
                child: Fade(
                  delay: 1000,
                  mili: 400,
                  child: Container(
                    margin: EdgeInsets.only(left: 0, top: 0),
                    height: 300,
                    child: Image.asset(
                      'image/1x/fundo_agua.png',
                      fit: BoxFit.fill,
                      //color: Color(0xff078F4A),
                      //colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: top2 / 2,
                child: Fade(
                  delay: 1000,
                  mili: 400,
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    height: 300,
                    child: Image.asset(
                      'image/1x/raja.png',
                      fit: BoxFit.fill,
                      //color: Colors.blueGrey[700],
                      //colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: top / 2,
                child: Fade(
                  delay: 1000,
                  mili: 400,
                  child: Container(
                    margin: EdgeInsets.only(left: 0, top: 0),
                    height: 200,
                    child: Image.asset(
                      'image/1x/fundo_alga.png',
                      fit: BoxFit.fill,
                      //color: Color(0xffCBA432),
                      //colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: (top),
                child: Fade(
                  delay: 1000,
                  mili: 400,
                  child: Container(
                    //width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      left: 50,
                      top: 100,
                    ),
                    height: 50,
                    child: Image.asset(
                      'image/1x/fundo_peixe.png',
                      fit: BoxFit.fill,
                      // color: Colors.blueGrey[300],
                      //colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              /* Positioned(
                top: -50 + (top * 1.5),
                child: Fade(
                  delay: 1000,
                  mili: 400,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      left: 0,
                    ),
                    height: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'image/cena.png',
                      fit: BoxFit.fitHeight,
                      //color: Colors.blueGrey[300],
                      //colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),*/
              Positioned(
                top: 490 + (top * 1.5),
                child: Fade(
                  delay: 1000,
                  mili: 400,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      left: 0,
                    ),
                    height: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'image/cena.png',
                      fit: BoxFit.fitHeight,
                      //color: Colors.blueGrey[300],
                      //colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              Observer(builder: (_) {
                return ListView(
                  children: [
                    Fade(
                      delay: 10,
                      mili: 500,
                      child: Container(
                        margin: EdgeInsets.only(top: 200),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              color: Colors.black26,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
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
                            Observer(builder: (_) {
                              return Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ...mob.anos_Peixe.map((item) {
                                      return Cards(
                                          ano: item.ano,
                                          anual: item.anual,
                                          venda: item.venda,
                                          receita: item.receita,
                                          total: item.total);
                                      ;
                                    }).toList(),
                                  ],
                                ),
                              );
                            }),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            color: Colors.black26,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(children: [
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
                        Observer(builder: (_) {
                          return Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...mob.anos_Peixe.map((item) {
                                  return Cards(
                                      ano: item.ano,
                                      anual: item.anual,
                                      venda: item.venda,
                                      receita: item.receita,
                                      total: item.total);
                                }).toList(),
                              ],
                            ),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Observer(builder: (_) {
                          return Grafico(dados: mob.dados_grafico);
                        }),
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
                            "FLUXO DE CAIXA",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black.withAlpha(170),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Observer(builder: (_) {
                          return Container(
                            height: 250,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...mob.anos_Geral.map((item) {
                                  return CardsGeral(
                                    ano: item.ano,
                                    receitas: item.receitas,
                                    fluxoLivre: item.fluxoLivre,
                                    fluxoOperacional: item.fluxoOperacional,
                                    custo: item.custo,
                                    investimento: item.investimento,
                                    capGiro: item.capGiro,
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        }),
                      ]),
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
