import 'package:flutter/material.dart';

class Linha extends StatelessWidget {
  String nome;
  String valor;
  double larg = 250;
  bool destacado = false;

  Linha({
    Key? key,
    required this.nome,
    required this.valor,
    this.larg = 227,
    this.destacado = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: larg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nome,
            style: TextStyle(
              color: (destacado) ? Colors.black.withAlpha(190) : Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Divider(
              indent: 7,
              endIndent: 7,
              thickness: 1,
            ),
          ),
          Text(
            "R\$ $valor",
            style: TextStyle(
              color: (destacado)
                  ? Colors.black.withAlpha(230)
                  : Colors.black.withAlpha(170),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  String ano;
  double anual;
  double venda;
  double receita;
  double total;
  Cards({
    Key? key,
    this.ano = "an",
    required this.anual,
    required this.venda,
    required this.receita,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 3), blurRadius: 15, color: Colors.black26),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ano,
                  style: TextStyle(
                    color: Colors.black.withAlpha(170),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Linha(
                    nome: "Prod. Anual (Un.)", valor: anual.toStringAsFixed(2)),
                Linha(
                    nome: "Preço de Venda (S/Un.)",
                    valor: venda.toStringAsFixed(2)),
                Linha(nome: "Receita (RS)", valor: receita.toStringAsFixed(2)),
                Linha(
                    nome: "Custo Total Anual", valor: total.toStringAsFixed(2)),
              ],
            ),
          )),
    );
  }
}
