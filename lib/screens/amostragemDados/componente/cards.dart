import 'package:flutter/material.dart';

class Linha extends StatelessWidget {
  String nome;
  String valor;
  double larg = 250;

  Linha({
    Key? key,
    required this.nome,
    required this.valor,
    this.larg = 227,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nome,
            style: TextStyle(
              color: Colors.black45,
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
            valor,
            style: TextStyle(
              color: Colors.black.withAlpha(170),
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
                Linha(nome: "Prod. Anual (Un.)", valor: anual.toString()),
                Linha(nome: "Preço de Venda (S/Un.)", valor: venda.toString()),
                Linha(nome: "Receita (RS)", valor: receita.toString()),
                Linha(nome: "Custo Total Anual", valor: total.toString()),
              ],
            ),
          )),
    );
  }
}
