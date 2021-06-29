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
    mob.calcular();
    mob.random();
    aguarda();
    super.initState();
  }

  void aguarda() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fade(
        inverte: true,
        delay: 1600,
        mili: 500,
        child: Container(
          color: Colors.blueGrey[900],
        ),
      ),
    );
  }
}
