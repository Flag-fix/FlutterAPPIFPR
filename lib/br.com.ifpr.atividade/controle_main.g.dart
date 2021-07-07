// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controle_main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControleMain on _ControleMain, Store {
  final _$contadorAtom = Atom(name: '_ControleMain.contador');

  @override
  int get contador {
    _$contadorAtom.reportRead();
    return super.contador;
  }

  @override
  set contador(int value) {
    _$contadorAtom.reportWrite(value, super.contador, () {
      super.contador = value;
    });
  }

  final _$_ControleMainActionController =
      ActionController(name: '_ControleMain');

  @override
  dynamic adicionar() {
    final _$actionInfo = _$_ControleMainActionController.startAction(
        name: '_ControleMain.adicionar');
    try {
      return super.adicionar();
    } finally {
      _$_ControleMainActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contador: ${contador}
    ''';
  }
}
