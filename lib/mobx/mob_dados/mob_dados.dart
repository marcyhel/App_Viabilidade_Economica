import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

part 'mob_dados.g.dart';

class Mob_dados = _Mob_dados with _$Mob_dados;

abstract class _Mob_dados with Store {
  _Mob_dados() {
    print(tuto);
  }
  @observable
  ChartSeriesController? chartSeriesController;

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
  @observable
  var dados_grafico = ObservableList<SalesData>.of([
    SalesData('3', -10),
    SalesData('Feb2', 20),
    SalesData('Mar2', 30),
    SalesData('Apr2', -28),
    SalesData('May2', 10),
    SalesData('Jan1', 30),
  ]);
  var cont = 5;
  @action
  void random() {
    var aux = Random().nextInt(20) - 10;
    anos_Peixe = ObservableList<Anos>.of([
      Anos("ano 1" + "$aux"),
      Anos("ano 2" + "$aux"),
      Anos("ano 3" + "$aux"),
      Anos("ano 4" + "$aux"),
    ]);

    dados_grafico.add(SalesData(cont.toString(), Random().nextInt(20) - 10));
    cont++;
    dados_grafico.removeAt(0);
    chartSeriesController?.updateDataSource(
      addedDataIndexes: <int>[dados_grafico.length - 1],
      removedDataIndexes: <int>[0],
    );

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
