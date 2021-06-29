import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:plan3/mobx/mob_dados/mob_dados.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class CardImput extends StatelessWidget {
  String title;
  final Function escreve;
  bool erro;
  double hiden;
  CardImput({
    Key? key,
    required this.title,
    required this.escreve,
    required this.erro,
    required this.hiden,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1), blurRadius: 15, color: Colors.black12),
          ],
        ),
        margin: EdgeInsets.only(top: 5, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black.withAlpha(120),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              autofocus: true,
              onChanged: (valor) {
                escreve(valor);
              },
              style: TextStyle(
                fontSize: 19,
                color: Colors.black.withAlpha(120),
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                helperText: 'dsd',
                fillColor: Colors.blueGrey.withAlpha(10),
                filled: true,
                isDense: true,
                errorText: (erro) ? mob.erro : null,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
