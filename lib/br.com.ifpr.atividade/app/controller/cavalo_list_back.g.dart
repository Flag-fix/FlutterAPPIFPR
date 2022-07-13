// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cavalo_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CavaloListBack on _CavaloListBack, Store {
  final _$listaAtom = Atom(name: '_CavaloListBack.lista');

  @override
  Future<List<NewCavalo>> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<List<NewCavalo>> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_CavaloListBackActionController =
      ActionController(name: '_CavaloListBack');

  @override
  dynamic updateLista([dynamic value]) {
    final _$actionInfo = _$_CavaloListBackActionController.startAction(
        name: '_CavaloListBack.updateLista');
    try {
      return super.updateLista(value);
    } finally {
      _$_CavaloListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
