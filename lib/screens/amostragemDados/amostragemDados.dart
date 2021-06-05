import 'package:flutter/material.dart';

class AmostragemDados extends StatefulWidget {
  @override
  _AmostragemDadosState createState() => _AmostragemDadosState();
}

class _AmostragemDadosState extends State<AmostragemDados> {
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
              top -= v.scrollDelta! / 2;
              top2 -= v.scrollDelta! / 3;
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
                  margin: EdgeInsets.only(left: 0, top: 30),
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
                  margin: EdgeInsets.only(left: 20, top: 80),
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
                  margin: EdgeInsets.only(top: 50),
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
                  margin: EdgeInsets.only(left: 50, top: 20),
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
                top: -80 + (top * 1.3),
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
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 150),
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("data"),
                        ),
                      ],
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
