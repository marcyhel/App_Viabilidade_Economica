import 'package:flutter/material.dart';

import 'package:plan3/screens/amostragemDados/componente/cards.dart';

class CardsGeral extends StatelessWidget {
  String ano;
  double receitas;
  double custo;
  double fluxoOperacional;
  double investimento;
  double capGiro;
  double fluxoLivre;
  CardsGeral({
    Key? key,
    this.ano = "an",
    required this.receitas,
    required this.custo,
    required this.fluxoOperacional,
    required this.investimento,
    required this.capGiro,
    required this.fluxoLivre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: 350,
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
                  nome: "Receitas (peixes+alfaces)",
                  valor: receitas.toStringAsFixed(2),
                  larg: 370,
                ),
                Linha(
                  nome: "Custos (peixes+alfaces)",
                  valor: custo.toStringAsFixed(2),
                  larg: 370,
                ),
                Linha(
                  nome: "Fluxo de caixa operacional",
                  valor: fluxoOperacional.toStringAsFixed(2),
                  larg: 370,
                  destacado: true,
                ),
                Linha(
                  nome: "Investimento/Desinvestimento",
                  valor: investimento.toStringAsFixed(2),
                  larg: 370,
                ),
                Linha(
                  nome: " +/- Capital de giro",
                  valor: capGiro.toStringAsFixed(2),
                  larg: 370,
                ),
                Linha(
                  nome: "Fluxo de caixa livre",
                  valor: fluxoLivre.toStringAsFixed(2),
                  larg: 370,
                  destacado: true,
                ),
              ],
            ),
          )),
    );
  }
}
