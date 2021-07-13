import 'package:flutter/material.dart';

class Paragrafo extends StatelessWidget {
  const Paragrafo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "v) ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: Text(
            " projetar os fluxos de caixa operacionais, tais como, preços de venda, quantidade vendida, custos fixos, com a implantação do sistema de produção de peixes associado a produção de alface, denominado sistema aquapônico, e os custos variáveis com manutenção e operacionalização envolvidos no processo produtivo;",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ]),
    );
  }
}
