import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plan3/mobx/mob_dados/mob_dados.dart';
import 'package:plan3/screens/componentes/fade.dart';
import 'package:plan3/screens/home.dart';

class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  final Mob_dados mob = GetIt.I<Mob_dados>();
  @override
  initState() {
    print("load");

    aguarda();
    super.initState();
  }

  void aguarda() async {
    //await mob.carregarDados();
    mob.calcular();
    mob.random();
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fade(
        delay: 0,
        mili: 300,
        child: Fade(
          inverte: true,
          delay: 1300,
          mili: 500,
          child: Container(
            color: Color(0xff052F43),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CircularProgressIndicator(
                    color: Color(0xff0AB855),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
