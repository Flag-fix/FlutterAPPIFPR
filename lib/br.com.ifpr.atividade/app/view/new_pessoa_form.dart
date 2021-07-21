import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/pessoa_form_back.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewPessoaForm extends StatelessWidget {
  NewPessoaForm({Key key}) : super(key: key);

  final _form = GlobalKey<FormState>();

  Widget fieldName(PessoaFormBack back) {
    return TextFormField(
      validator: back.validacaoNome,
        onSaved: (newValue)=> back.pessoa.nome = newValue,
      initialValue: back.pessoa.nome,
        decoration: InputDecoration(
            labelText: 'Insira um Nome:',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldTelefone(PessoaFormBack back) {
    var tel = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        validator: back.validacaoTelefone,
        onSaved: (newValue)=> back.pessoa.contato = newValue,
        initialValue: back.pessoa.contato,
        keyboardType: TextInputType.phone,
        inputFormatters: [tel],
        decoration: InputDecoration(
            labelText: 'Telefone',
            hintText: '(99) 9999-9999',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldFoto(PessoaFormBack back) {
    return TextFormField(
        onSaved: (newValue)=> back.pessoa.foto = newValue,
      initialValue: back.pessoa.foto,
        decoration: InputDecoration(
            labelText: 'URL',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldReferencia(PessoaFormBack back) {
    var ref = MaskTextInputFormatter(mask: 'Ref-######');
    return TextFormField(
        validator: back.validacaoReferencia,
        onSaved: (newValue)=> back.pessoa.referencia = newValue,
      initialValue: back.pessoa.referencia,
        inputFormatters: [ref],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Insira uma referencia',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldData(PessoaFormBack back) {
    var data = MaskTextInputFormatter(mask: '########');
    return TextFormField(
        onSaved: (newValue)=> back.pessoa.data = DateTime.parse(newValue),
    initialValue: back.pessoa.data.toString(),
        keyboardType: TextInputType.datetime,
        inputFormatters: [data],
        decoration: InputDecoration(
            labelText: 'Data',
            hintText: '01/01/2021',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  @override
  Widget build(BuildContext context) {
    var _back = PessoaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contato'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if(_back.isValid){
                  _back.salvar();
/*                  Navigator.of(context).pop();*/
                  Navigator.of(context).pushNamed('lista');
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              SizedBox(height: 15),
              fieldTelefone(_back),
              SizedBox(height: 15),
              fieldFoto(_back),
              SizedBox(height: 15),
              fieldReferencia(_back),
              SizedBox(height: 15),
              fieldData(_back),
            ],
          ),
        ),
      ),
    );
  }
}
