import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

part 'mob_dados.g.dart';

class Mob_dados = _Mob_dados with _$Mob_dados;

abstract class _Mob_dados with Store {
  _Mob_dados() {
    autorun((_) {
      print(custoTanquePeixe);
    });
    print(tuto);
  }
  @observable
  ChartSeriesController? chartSeriesController;
  String erro = "não pode usar ,(virgula)";
  @observable
  int tuto = 1;
  @observable
  int data = 1;
  @observable
  var anos_Peixe = ObservableList<Anos>.of([
    Anos("ano 1"),
    Anos("ano 2"),
    Anos("ano 3"),
    Anos("ano 4"),
  ]);
  var cont = 5;
  @observable
  var dados_grafico = ObservableList<SalesData>.of([]);
  @computed
  List<SalesData> get graf => dados_grafico;

  @observable
  double producaoPeixe = 1;
  @observable
  double producaoAlface = 1;
  @observable
  double ciclosProducaoPeixeAno = 1;
  @observable
  double ciclosProducaoAlfaceAno = 1;
  @observable
  double numeroPeixeCiclo = 1;
  @observable
  double numeroAlfaceCiclo = 1;
  @observable
  double unidadeComercializadaCicloAlface = 1;
  @observable
  double unidadeComercializadaCicloPeixe = 1;
  @observable
  double numeroProdutosComercializadoCicloAlface = 1;
  @observable
  double numeroProdutosComercializadoCicloPeixe = 1;
  @observable
  double precoPeixe = 1;
  @observable
  double precoAlface = 1;
  @observable
  double custoEnergia = 1;
  @observable
  double custoMaterialHidraulico = 1;
  @observable
  double custoMaterialEletrico = 1;
  @observable
  double custoMaterialAltomacao = 1;
  @observable
  double custoFixoExtra = 1;
  @observable
  double custoTanquePeixe = 1;

  @observable
  bool booProducaoPeixe = false;
  @observable
  bool booProducaoAlface = false;
  @observable
  bool booCiclosProducaoPeixeAno = false;
  @observable
  bool booCiclosProducaoAlfaceAno = false;
  @observable
  bool booNumeroPeixeCiclo = false;
  @observable
  bool booNumeroAlfaceCiclo = false;
  @observable
  bool booUnidadeComercializadaCicloAlface = false;
  @observable
  bool booUnidadeComercializadaCicloPeixe = false;
  @observable
  bool booNumeroProdutosComercializadoCicloAlface = false;
  @observable
  bool booNumeroProdutosComercializadoCicloPeixe = false;
  @observable
  bool booPrecoPeixe = false;
  @observable
  bool booPrecoAlface = false;
  @observable
  bool booCustoEnergia = false;
  @observable
  bool booCustoMaterialHidraulico = false;
  @observable
  bool booCustoMaterialEletrico = false;
  @observable
  bool booCustoMaterialAltomacao = false;
  @observable
  bool booCustoFixoExtra = false;
  @observable
  bool booCustoTanquePeixe = false;

  @action
  void escreveProducaoPeixe(String valor) {
    try {
      producaoPeixe = double.parse(valor);
      booProducaoPeixe = false;
    } catch (e) {
      booProducaoPeixe = true;
    }
  }

  @action
  void escreveProducaoAlface(String valor) {
    try {
      producaoAlface = double.parse(valor);
      booProducaoAlface = false;
    } catch (e) {
      booProducaoAlface = true;
    }
  }

  @action
  void escreveCiclosProducaoPeixeAno(String valor) {
    try {
      ciclosProducaoPeixeAno = double.parse(valor);
      booCiclosProducaoPeixeAno = false;
    } catch (e) {
      booCiclosProducaoPeixeAno = true;
    }
  }

  @action
  void escreveCiclosProducaoAlfaceAno(String valor) {
    try {
      ciclosProducaoAlfaceAno = double.parse(valor);
      booCiclosProducaoAlfaceAno = false;
    } catch (e) {
      booCiclosProducaoAlfaceAno = true;
    }
  }

  @action
  void escreveNumeroPeixeCiclo(String valor) {
    try {
      numeroPeixeCiclo = double.parse(valor);
      booNumeroPeixeCiclo = false;
    } catch (e) {
      booNumeroPeixeCiclo = true;
    }
  }

  @action
  void escreveNumeroAlfaceCiclo(String valor) {
    try {
      numeroAlfaceCiclo = double.parse(valor);
      booNumeroAlfaceCiclo = false;
    } catch (e) {
      booNumeroAlfaceCiclo = true;
    }
  }

  @action
  void escreveUnidadeComercializadaCicloAlface(String valor) {
    try {
      unidadeComercializadaCicloAlface = double.parse(valor);
      booUnidadeComercializadaCicloAlface = false;
    } catch (e) {
      booUnidadeComercializadaCicloAlface = true;
    }
  }

  @action
  void escreveUnidadeComercializadaCicloPeixe(String valor) {
    try {
      unidadeComercializadaCicloPeixe = double.parse(valor);
      booUnidadeComercializadaCicloPeixe = false;
    } catch (e) {
      booUnidadeComercializadaCicloPeixe = true;
    }
  }

  @action
  void escreveNumeroProdutosComercializadoCicloAlface(String valor) {
    try {
      numeroProdutosComercializadoCicloAlface = double.parse(valor);
      booNumeroProdutosComercializadoCicloAlface = false;
    } catch (e) {
      booNumeroProdutosComercializadoCicloAlface = true;
    }
  }

  @action
  void escreveNumeroProdutosComercializadoCicloPeixe(String valor) {
    try {
      numeroProdutosComercializadoCicloPeixe = double.parse(valor);
      booNumeroProdutosComercializadoCicloPeixe = false;
    } catch (e) {
      booNumeroProdutosComercializadoCicloPeixe = true;
    }
  }

  @action
  void escrevePrecoPeixe(String valor) {
    try {
      precoPeixe = double.parse(valor);
      booPrecoPeixe = false;
    } catch (e) {
      booPrecoPeixe = true;
    }
  }

  @action
  void escrevePrecoAlface(String valor) {
    try {
      precoAlface = double.parse(valor);
      booPrecoAlface = false;
    } catch (e) {
      booPrecoAlface = true;
    }
  }

  @action
  void escreveCustoEnergia(String valor) {
    try {
      custoEnergia = double.parse(valor);
      booCustoEnergia = false;
    } catch (e) {
      booCustoEnergia = true;
    }
  }

  @action
  void escreveCustoMaterialHidraulico(String valor) {
    try {
      custoMaterialHidraulico = double.parse(valor);
      booCustoMaterialHidraulico = false;
    } catch (e) {
      booCustoMaterialHidraulico = true;
    }
  }

  @action
  void escreveCustoMaterialEletrico(String valor) {
    try {
      custoMaterialEletrico = double.parse(valor);
      booCustoMaterialEletrico = false;
    } catch (e) {
      booCustoMaterialEletrico = true;
    }
  }

  @action
  void escreveCustoMaterialAltomacao(String valor) {
    try {
      custoMaterialAltomacao = double.parse(valor);
      booCustoMaterialAltomacao = false;
    } catch (e) {
      booCustoMaterialAltomacao = true;
    }
  }

  @action
  void escreveCustoFixoExtra(String valor) {
    try {
      custoFixoExtra = double.parse(valor);
      booCustoFixoExtra = false;
    } catch (e) {
      booCustoFixoExtra = true;
    }
  }

  @action
  void escreveCustoTanquePeixe(String valor) {
    try {
      custoTanquePeixe = double.parse(valor);
      booCustoTanquePeixe = false;
    } catch (e) {
      booCustoTanquePeixe = true;
    }
  }

  @action
  Future<void> random() async {
    print("ddd");
    var aux = Random().nextInt(20) - 10;
    anos_Peixe = ObservableList<Anos>.of([
      Anos("ano 1" + "$aux"),
      Anos("ano 2" + "$aux"),
      Anos("ano 3" + "$aux"),
      Anos("ano 4" + "$aux"),
    ]);

    dados_grafico = ObservableList<SalesData>.of([
      SalesData('3', Random().nextInt(20) - 10),
      SalesData('Feb2', Random().nextInt(20) - 10),
      SalesData('Mar2', Random().nextInt(20) - 10),
      SalesData('Apr2', Random().nextInt(20) - 10),
      SalesData('May2', Random().nextInt(20) - 10),
      SalesData('Jan1', Random().nextInt(20) - 10),
    ]);
    chartSeriesController?.updateDataSource(addedDataIndexes: [0]);
    print(dados_grafico[0].sales);
  }

  @action
  void setData(int valor) => data = valor;
  @action
  void settuto(int valor) => tuto = valor;
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class Anos {
  final String ano;
  Anos(this.ano);
}
