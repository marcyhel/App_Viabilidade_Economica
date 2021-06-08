// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_dados.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_dados on _Mob_dados, Store {
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

  final _$dados_graficoAtom = Atom(name: '_Mob_dados.dados_grafico');

  @override
  ObservableList<_SalesData> get dados_grafico {
    _$dados_graficoAtom.reportRead();
    return super.dados_grafico;
  }

  @override
  set dados_grafico(ObservableList<_SalesData> value) {
    _$dados_graficoAtom.reportWrite(value, super.dados_grafico, () {
      super.dados_grafico = value;
    });
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
tuto: ${tuto},
data: ${data},
dados_grafico: ${dados_grafico}
    ''';
  }
}
