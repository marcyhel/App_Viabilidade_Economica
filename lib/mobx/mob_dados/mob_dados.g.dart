// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_dados.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_dados on _Mob_dados, Store {
  final _$chartSeriesControllerAtom =
      Atom(name: '_Mob_dados.chartSeriesController');

  @override
  ChartSeriesController? get chartSeriesController {
    _$chartSeriesControllerAtom.reportRead();
    return super.chartSeriesController;
  }

  @override
  set chartSeriesController(ChartSeriesController? value) {
    _$chartSeriesControllerAtom.reportWrite(value, super.chartSeriesController,
        () {
      super.chartSeriesController = value;
    });
  }

  final _$tutoAtom = Atom(name: '_Mob_dados.tuto');

  @override
  int get tuto {
    _$tutoAtom.reportRead();
    return super.tuto;
  }

  @override
  set tuto(int value) {
    _$tutoAtom.reportWrite(value, super.tuto, () {
      super.tuto = value;
    });
  }

  final _$dataAtom = Atom(name: '_Mob_dados.data');

  @override
  int get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(int value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$anos_PeixeAtom = Atom(name: '_Mob_dados.anos_Peixe');

  @override
  ObservableList<Anos> get anos_Peixe {
    _$anos_PeixeAtom.reportRead();
    return super.anos_Peixe;
  }

  @override
  set anos_Peixe(ObservableList<Anos> value) {
    _$anos_PeixeAtom.reportWrite(value, super.anos_Peixe, () {
      super.anos_Peixe = value;
    });
  }

  final _$dados_graficoAtom = Atom(name: '_Mob_dados.dados_grafico');

  @override
  ObservableList<SalesData> get dados_grafico {
    _$dados_graficoAtom.reportRead();
    return super.dados_grafico;
  }

  @override
  set dados_grafico(ObservableList<SalesData> value) {
    _$dados_graficoAtom.reportWrite(value, super.dados_grafico, () {
      super.dados_grafico = value;
    });
  }

  final _$randomAsyncAction = AsyncAction('_Mob_dados.random');

  @override
  Future<void> random() {
    return _$randomAsyncAction.run(() => super.random());
  }

  final _$_Mob_dadosActionController = ActionController(name: '_Mob_dados');

  @override
  void setData(int valor) {
    final _$actionInfo =
        _$_Mob_dadosActionController.startAction(name: '_Mob_dados.setData');
    try {
      return super.setData(valor);
    } finally {
      _$_Mob_dadosActionController.endAction(_$actionInfo);
    }
  }

  @override
  void settuto(int valor) {
    final _$actionInfo =
        _$_Mob_dadosActionController.startAction(name: '_Mob_dados.settuto');
    try {
      return super.settuto(valor);
    } finally {
      _$_Mob_dadosActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chartSeriesController: ${chartSeriesController},
tuto: ${tuto},
data: ${data},
anos_Peixe: ${anos_Peixe},
dados_grafico: ${dados_grafico}
    ''';
  }
}
