// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoaListBack on _PessoaListBack, Store {
  final _$listaAtom = Atom(name: '_PessoaListBack.lista');

  @override
  Future<List<NewPessoa>> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<List<NewPessoa>> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_PessoaListBackActionController =
      ActionController(name: '_PessoaListBack');

  @override
  dynamic updateLista([dynamic value]) {
    final _$actionInfo = _$_PessoaListBackActionController.startAction(
        name: '_PessoaListBack.updateLista');
    try {
      return super.updateLista(value);
    } finally {
      _$_PessoaListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
