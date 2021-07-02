import 'dart:math';

import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

part 'mob_dados.g.dart';

class Mob_dados = _Mob_dados with _$Mob_dados;

abstract class _Mob_dados with Store {
  Box box;
  _Mob_dados(
    this.box,
  ) {
    autorun((_) {
      print(custoTanquePeixe);
    });
    print(tuto);
    //carregarDados();
  }

  Future<void> carregarDados() async {
    box = await Hive.openBox('minhaCaixa1');

    producaoPeixe = (box.get('producaoPeixe') == null)
        ? 0
        : double.parse(box.get('producaoPeixe'));
    producaoAlface = (box.get('producaoAlface') == null)
        ? 0
        : double.parse(box.get('producaoAlface'));
    ciclosProducaoPeixeAno = (box.get('ciclosProducaoPeixeAno') == null)
        ? 0
        : double.parse(box.get('ciclosProducaoPeixeAno'));
    ciclosProducaoAlfaceAno = (box.get('ciclosProducaoAlfaceAno') == null)
        ? 0
        : double.parse(box.get('ciclosProducaoAlfaceAno'));
    numeroPeixeCiclo = (box.get('numeroPeixeCiclo') == null)
        ? 0
        : double.parse(box.get('numeroPeixeCiclo'));
    numeroAlfaceCiclo = (box.get('numeroAlfaceCiclo') == null)
        ? 0
        : double.parse(box.get('numeroAlfaceCiclo'));
    unidadeComercializadaCicloAlface =
        (box.get('unidadeComercializadaCicloAlface') == null)
            ? 0
            : double.parse(box.get('unidadeComercializadaCicloAlface'));
    unidadeComercializadaCicloPeixe =
        (box.get('unidadeComercializadaCicloPeixe') == null)
            ? 0
            : double.parse(box.get('unidadeComercializadaCicloPeixe'));
    numeroProdutosComercializadoCicloAlface =
        (box.get('numeroProdutosComercializadoCicloAlface') == null)
            ? 0
            : double.parse(box.get('numeroProdutosComercializadoCicloAlface'));
    numeroProdutosComercializadoCicloPeixe =
        (box.get('numeroProdutosComercializadoCicloPeixe') == null)
            ? 0
            : double.parse(box.get('numeroProdutosComercializadoCicloPeixe'));
    precoPeixe = (box.get('precoPeixe') == null)
        ? 0
        : double.parse(box.get('precoPeixe'));
    precoAlface = (box.get('precoAlface') == null)
        ? 0
        : double.parse(box.get('precoAlface'));

    custoEnergia = (box.get('custoEnergia') == null)
        ? 0
        : double.parse(box.get('custoEnergia'));
    print(custoEnergia);

    custoMaterialHidraulico = (box.get('custoMaterialHidraulico') == null)
        ? 0
        : double.parse(box.get('custoMaterialHidraulico'));
    custoMaterialEletrico = (box.get('custoMaterialEletrico') == null)
        ? 0
        : double.parse(box.get('custoMaterialEletrico'));
    custoMaterialAltomacao = (box.get('custoMaterialAltomacao') == null)
        ? 0
        : double.parse(box.get('custoMaterialAltom'));
    custoFixoExtra = (box.get('custoFixoExtra') == null)
        ? 0
        : double.parse(box.get('custoFixoExtra'));
    custoTanquePeixe = (box.get('custoTanquePeixe') == null)
        ? 0
        : double.parse(box.get('custoTanquePeixe'));
    taxaReinvestimentoFluxoCaixa =
        (box.get('taxaReinvestimentoFluxoCaixa') == null)
            ? 0
            : double.parse(box.get('taxaReinvestimentoFluxoCaixa'));
  }

  @observable
  ChartSeriesController? chartSeriesController;
  String erro = "Use pontos no lugar de virgulas";
  @observable
  int tuto = 1;
  @observable
  int data = 1;
  @observable
  var anos_Peixe = ObservableList<Anos>.of([
    Anos("Ano 1"),
    Anos("Ano 2"),
    Anos("Ano 3"),
    Anos("Ano 4"),
    Anos("Ano 5"),
  ]);
  @observable
  var anos_Alface = ObservableList<Anos>.of([
    Anos("Ano 1"),
    Anos("Ano 2"),
    Anos("Ano 3"),
    Anos("Ano 4"),
    Anos("Ano 5"),
  ]);
  @observable
  var anos_Geral = ObservableList<AnosGeral>.of([
    AnosGeral("Ano 0"),
    AnosGeral("Ano 1"),
    AnosGeral("Ano 2"),
    AnosGeral("Ano 3"),
    AnosGeral("Ano 4"),
    AnosGeral("Ano 5"),
  ]);
  var cont = 5;
  @observable
  var dados_grafico = ObservableList<SalesData>.of([]);
  @computed
  List<SalesData> get graf => dados_grafico;

  @observable
  double investimentoInicial = 0;
  @observable
  double capitalGiro = 0;
  @observable
  double vendaEquipamentos = 0;
  @observable
  double valorResidual = 0;

  @action
  void calcularGeral() {
    for (var i = 0; i < anos_Geral.length; i++) {
      if (i == 0 && investimentoInicial != 0) {
        anos_Geral[i].investimento = -investimentoInicial;
        anos_Geral[i].capGiro = -capitalGiro;
        anos_Geral[i].fluxoLivre = -(investimentoInicial + capitalGiro);
      }
      if (i == anos_Geral.length - 1) {
        anos_Geral[i].investimento = vendaEquipamentos;
        anos_Geral[i].capGiro = capitalGiro;
      }
      if (i > 0) {
        anos_Geral[i].receitas =
            anos_Peixe[i - 1].receita + anos_Alface[i - 1].receita;
        anos_Geral[i].custo =
            anos_Peixe[i - 1].total + anos_Alface[i - 1].total;
        anos_Geral[i].fluxoOperacional =
            anos_Geral[i].receitas + anos_Geral[i].custo;

        anos_Geral[i].fluxoLivre = anos_Geral[i].fluxoOperacional +
            anos_Geral[i].capGiro +
            anos_Geral[i].investimento;
      }
    }
    dados_grafico = ObservableList<SalesData>.of([
      SalesData('Ano 1', anos_Geral[0].fluxoLivre),
      SalesData('Ano 2', anos_Geral[1].fluxoLivre),
      SalesData('Ano 3', anos_Geral[2].fluxoLivre),
      SalesData('Ano 4', anos_Geral[3].fluxoLivre),
      SalesData('Ano 5', anos_Geral[4].fluxoLivre),
      SalesData('Ano 6', anos_Geral[5].fluxoLivre),
    ]);
  }

  @action
  void calcular() {
    print(custoEnergia);
    print(box.get('custoEnergia'));
    print("calc");
    investimentoInicial = custoTanquePeixe +
        custoMaterialEletrico +
        custoMaterialHidraulico +
        custoMaterialAltomacao +
        custoFixoExtra;

    capitalGiro = (1 + 0.1) * custoEnergia;

    vendaEquipamentos = investimentoInicial * taxaDesenvestimento;
    valorResidual = capitalGiro + vendaEquipamentos;

    anos_Peixe[0].anual = ciclosProducaoPeixeAno * numeroPeixeCiclo;
    anos_Peixe[0].venda = precoPeixe;
    anos_Peixe[0].receita =
        ((ciclosProducaoPeixeAno * numeroPeixeCiclo) * precoPeixe);
    anos_Peixe[0].total = capitalGiro * ciclosProducaoPeixeAno;

    anos_Alface[0].anual = ciclosProducaoAlfaceAno * numeroAlfaceCiclo;
    anos_Alface[0].venda = precoAlface;
    anos_Alface[0].receita =
        ((ciclosProducaoAlfaceAno * numeroAlfaceCiclo) * precoAlface);
    anos_Alface[0].total = capitalGiro * ciclosProducaoAlfaceAno;

    for (var i = 0; i < periodoAnalise - 1; i++) {
      anos_Peixe[i + 1].anual = anos_Peixe[0].anual;
      anos_Peixe[i + 1].venda = anos_Peixe[0].venda;
      anos_Peixe[i + 1].receita = anos_Peixe[0].receita;
      anos_Peixe[i + 1].total = anos_Peixe[0].total;

      anos_Alface[i + 1].anual = anos_Alface[0].anual;
      anos_Alface[i + 1].venda = anos_Alface[0].venda;
      anos_Alface[i + 1].receita = anos_Alface[0].receita;
      anos_Alface[i + 1].total = anos_Alface[0].total;
    }
    calcularGeral();
    print(investimentoInicial);
    print(capitalGiro);
    print(vendaEquipamentos);
  }

  @observable
  double taxaDesenvestimento = 0.1;
  @observable
  double periodoAnalise = 5;
  @observable
  double tma = 10;

  @observable
  double producaoPeixe = 0;
  @observable
  double producaoAlface = 0;
  @observable
  double ciclosProducaoPeixeAno = 0;
  @observable
  double ciclosProducaoAlfaceAno = 0;
  @observable
  double numeroPeixeCiclo = 0;
  @observable
  double numeroAlfaceCiclo = 0;
  @observable
  double unidadeComercializadaCicloAlface = 0;
  @observable
  double unidadeComercializadaCicloPeixe = 0;
  @observable
  double numeroProdutosComercializadoCicloAlface = 0;
  @observable
  double numeroProdutosComercializadoCicloPeixe = 0;
  @observable
  double precoPeixe = 0;
  @observable
  double precoAlface = 0;
  @observable
  double custoEnergia = 0;
  @observable
  double custoMaterialHidraulico = 0;
  @observable
  double custoMaterialEletrico = 0;
  @observable
  double custoMaterialAltomacao = 0;
  @observable
  double custoFixoExtra = 0;
  @observable
  double custoTanquePeixe = 0;
  @observable
  double taxaReinvestimentoFluxoCaixa = 0;

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
  @observable
  bool booTaxaReinvestimentoFluxoCaixa = false;

  @action
  void escreveProducaoPeixe(String valor) {
    try {
      producaoPeixe = double.parse(valor);
      box.put('producaoPeixe', valor);
      booProducaoPeixe = false;
    } catch (e) {
      booProducaoPeixe = true;
    }
  }

  @action
  void escreveProducaoAlface(String valor) {
    try {
      producaoAlface = double.parse(valor);
      box.put('producaoAlface', valor);
      booProducaoAlface = false;
    } catch (e) {
      booProducaoAlface = true;
    }
  }

  @action
  void escreveCiclosProducaoPeixeAno(String valor) {
    try {
      ciclosProducaoPeixeAno = double.parse(valor);
      box.put('ciclosProducaoPeixeAno', valor);
      booCiclosProducaoPeixeAno = false;
    } catch (e) {
      booCiclosProducaoPeixeAno = true;
    }
  }

  @action
  void escreveCiclosProducaoAlfaceAno(String valor) {
    try {
      ciclosProducaoAlfaceAno = double.parse(valor);
      box.put('ciclosProducaoAlfaceAno', valor);
      booCiclosProducaoAlfaceAno = false;
    } catch (e) {
      booCiclosProducaoAlfaceAno = true;
    }
  }

  @action
  void escreveNumeroPeixeCiclo(String valor) {
    try {
      numeroPeixeCiclo = double.parse(valor);
      box.put('numeroPeixeCiclo', valor);
      booNumeroPeixeCiclo = false;
    } catch (e) {
      booNumeroPeixeCiclo = true;
    }
  }

  @action
  void escreveNumeroAlfaceCiclo(String valor) {
    try {
      numeroAlfaceCiclo = double.parse(valor);
      box.put('numeroAlfaceCiclo', valor);
      booNumeroAlfaceCiclo = false;
    } catch (e) {
      booNumeroAlfaceCiclo = true;
    }
  }

  @action
  void escreveUnidadeComercializadaCicloAlface(String valor) {
    try {
      unidadeComercializadaCicloAlface = double.parse(valor);
      box.put('unidadeComercializadaCicloAlface', valor);
      booUnidadeComercializadaCicloAlface = false;
    } catch (e) {
      booUnidadeComercializadaCicloAlface = true;
    }
  }

  @action
  void escreveUnidadeComercializadaCicloPeixe(String valor) {
    try {
      unidadeComercializadaCicloPeixe = double.parse(valor);
      box.put('unidadeComercializadaCicloPeixe', valor);
      booUnidadeComercializadaCicloPeixe = false;
    } catch (e) {
      booUnidadeComercializadaCicloPeixe = true;
    }
  }

  @action
  void escreveNumeroProdutosComercializadoCicloAlface(String valor) {
    try {
      numeroProdutosComercializadoCicloAlface = double.parse(valor);
      box.put('numeroProdutosComercializadoCicloAlface', valor);
      booNumeroProdutosComercializadoCicloAlface = false;
    } catch (e) {
      booNumeroProdutosComercializadoCicloAlface = true;
    }
  }

  @action
  void escreveNumeroProdutosComercializadoCicloPeixe(String valor) {
    try {
      numeroProdutosComercializadoCicloPeixe = double.parse(valor);
      box.put('numeroProdutosComercializadoCicloPeixe', valor);
      booNumeroProdutosComercializadoCicloPeixe = false;
    } catch (e) {
      booNumeroProdutosComercializadoCicloPeixe = true;
    }
  }

  @action
  void escrevePrecoPeixe(String valor) {
    try {
      precoPeixe = double.parse(valor);
      box.put('precoPeixe', valor);
      booPrecoPeixe = false;
    } catch (e) {
      booPrecoPeixe = true;
    }
  }

  @action
  void escrevePrecoAlface(String valor) {
    try {
      precoAlface = double.parse(valor);
      box.put('precoAlface', valor);
      booPrecoAlface = false;
    } catch (e) {
      booPrecoAlface = true;
    }
  }

  @action
  void escreveCustoEnergia(String valor) {
    try {
      custoEnergia = double.parse(valor);
      box.put('custoEnergia', valor);
      print(box.get('custoEnergia'));
      booCustoEnergia = false;
    } catch (e) {
      booCustoEnergia = true;
    }
  }

  @action
  void escreveCustoMaterialHidraulico(String valor) {
    try {
      custoMaterialHidraulico = double.parse(valor);
      box.put('custoMaterialHidraulico', valor);
      booCustoMaterialHidraulico = false;
    } catch (e) {
      booCustoMaterialHidraulico = true;
    }
  }

  @action
  void escreveCustoMaterialEletrico(String valor) {
    try {
      custoMaterialEletrico = double.parse(valor);
      box.put('custoMaterialEletrico', valor);
      booCustoMaterialEletrico = false;
    } catch (e) {
      booCustoMaterialEletrico = true;
    }
  }

  @action
  void escreveCustoMaterialAltomacao(String valor) {
    try {
      custoMaterialAltomacao = double.parse(valor);
      box.put('custoMaterialAltomacao', valor);
      booCustoMaterialAltomacao = false;
    } catch (e) {
      booCustoMaterialAltomacao = true;
    }
  }

  @action
  void escreveCustoFixoExtra(String valor) {
    try {
      custoFixoExtra = double.parse(valor);
      box.put('custoFixoExtra', valor);
      booCustoFixoExtra = false;
    } catch (e) {
      booCustoFixoExtra = true;
    }
  }

  @action
  void escreveCustoTanquePeixe(String valor) {
    try {
      custoTanquePeixe = double.parse(valor);
      box.put('custoTanquePeixe', valor);
      booCustoTanquePeixe = false;
    } catch (e) {
      booCustoTanquePeixe = true;
    }
  }

  @action
  void escreveTaxaReinvestimentoFluxoCaixa(String valor) {
    try {
      taxaReinvestimentoFluxoCaixa = double.parse(valor);
      box.put('taxaReinvestimentoFluxoCaixa', valor);
      booTaxaReinvestimentoFluxoCaixa = false;
    } catch (e) {
      booTaxaReinvestimentoFluxoCaixa = true;
    }
  }

  @action
  Future<void> random() async {
    print("ddd");
    var aux = Random().nextInt(20) - 10;

    /*dados_grafico = ObservableList<SalesData>.of([
      SalesData('Ano 1', Random().nextInt(100) - 50),
      SalesData('Ano 2', Random().nextInt(100) - 50),
      SalesData('Ano 3', Random().nextInt(100) - 50),
      SalesData('Ano 4', Random().nextInt(100) - 50),
      SalesData('Ano 5', Random().nextInt(100) - 50),
      SalesData('Ano 6', Random().nextInt(100) - 50),
    ]);
    chartSeriesController?.updateDataSource(addedDataIndexes: [0]);
    print(dados_grafico[0].sales);*/
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
  double anual;
  double venda;
  double receita;
  double total;
  Anos(
    this.ano, {
    this.anual = 0,
    this.venda = 0,
    this.receita = 0,
    this.total = 0,
  });
}

class AnosGeral {
  String ano;
  double receitas;
  double custo;
  double fluxoOperacional;
  double investimento;
  double capGiro;
  double fluxoLivre;
  AnosGeral(
    this.ano, {
    this.receitas = 0,
    this.custo = 0,
    this.fluxoOperacional = 0,
    this.investimento = 0,
    this.capGiro = 0,
    this.fluxoLivre = 0,
  });
}
