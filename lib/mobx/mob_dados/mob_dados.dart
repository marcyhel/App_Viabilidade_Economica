import 'package:mobx/mobx.dart';

part 'mob_dados.g.dart';

class Mob_dados = _Mob_dados with _$Mob_dados;

abstract class _Mob_dados with Store {
  _Mob_dados() {
    print(tuto);
  }

  @observable
  int tuto = 1;
  @observable
  int data = 1;
  @observable
  var dados_grafico = ObservableList<_SalesData>.of([
    _SalesData('3', -10),
    _SalesData('Feb2', 20),
    _SalesData('Mar2', 30),
    _SalesData('Apr2', -28),
    _SalesData('May2', 10),
    _SalesData('Jan1', 30),
  ]);

  @action
  void setData(int valor) => data = valor;
  @action
  void settuto(int valor) => tuto = valor;
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
