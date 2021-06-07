import 'package:flutter/material.dart';
import 'package:plan3/screens/amostragemDados/componente/cards.dart';

class TileText extends StatefulWidget {
  String valor;
  TileText({
    Key? key,
    required this.valor,
  }) : super(key: key);

  @override
  _TileTextState createState() => _TileTextState();
}

class _TileTextState extends State<TileText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.valor,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black.withAlpha(170),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Linha(nome: "Investimento", valor: "R150.00"),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Linha(nome: "Capital de giro", valor: "R150.00"),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Linha(nome: "Total", valor: "R150.00"),
          ),
        ],
      ),
    );
  }
}
