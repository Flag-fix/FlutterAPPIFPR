import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_colors.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_text_styles.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/appBar/appBar.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/appBar/appBarTelas.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/card/cardCadastro.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/form/formBack/pessoa_form_back.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../my_app.dart';

class NewPessoaForm extends StatefulWidget {
  NewPessoaForm({Key key}) : super(key: key);

  @override
  _NewPessoaFormState createState() => _NewPessoaFormState();
}

var data = MaskTextInputFormatter(mask: '########');

class _NewPessoaFormState extends State<NewPessoaForm> {
  final _form = GlobalKey<FormState>();

  Widget fieldName(PessoaFormBack back) {
    return TextFormField(
        validator: back.validacaoNome,
        onSaved: (newValue) => back.pessoa.nome = newValue,
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
        onSaved: (newValue) => back.pessoa.contato = newValue,
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
        onSaved: (newValue) => back.pessoa.foto = newValue,
        initialValue: back.pessoa.foto,
        decoration: InputDecoration(
            labelText: 'URL Foto',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  Widget fieldReferencia(PessoaFormBack back) {
    var ref = MaskTextInputFormatter(mask: 'Ref-######');
    return TextFormField(
        validator: back.validacaoReferencia,
        onSaved: (newValue) => back.pessoa.referencia = newValue,
        initialValue: back.pessoa.referencia,
        inputFormatters: [ref],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Nº Crachá',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }

  String verificarData(PessoaFormBack back) {
    if (back.pessoa.data == null) {
      getText();
    } else {
      return DateFormat('dd/MM/yyyy').format(back.pessoa.data);
    }
  }

  Widget fieldData(PessoaFormBack back) {
    var data = MaskTextInputFormatter(mask: '########');
    return TextFormField(
        validator: back.validacaoData,
        onTap: () {
          _selectDate(context);
          FocusScope.of(context).requestFocus(new FocusNode());
          print(context);
        },
        initialValue: verificarData(back),
        keyboardType: TextInputType.datetime,
        inputFormatters: [data],
        decoration: InputDecoration(
            hintText: '01/01/2021',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            labelText: getText()),
        onSaved: (newValue) {
          back.pessoa.data = currentDate;
        });
  }

  DateTime currentDate;

  Future<void> _selectDate(BuildContext context) async {
    final datainicial = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: datainicial,
        firstDate: DateTime(datainicial.year - 2),
        lastDate: DateTime(datainicial.year + 5));
    if (pickedDate != null)
      setState(() {
        currentDate = pickedDate;
      });
  }

  String getText() {
    if (currentDate == null) {
      return 'Data de Entrada';
    } else {
      return DateFormat('dd/MM/yyyy').format(currentDate);
    }
  }

  Widget salvar(PessoaFormBack _back){
    return Padding(
      padding: const EdgeInsets.only(right: 55, left: 55),
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {
            _form.currentState.validate();
            _form.currentState.save();
            if (_back.isValid) {
              _back.salvar();
              Navigator.of(context).pushNamed(MyApp.PESSOA_LISTA);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.save),
              Padding(padding: EdgeInsets.all(16),
                child: Text("Salvar", style: TextStyle(fontSize: 20),),
              )],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    var _back = PessoaFormBack(context);
    return Scaffold(
      appBar:AppBarTelas("Cadastro",context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                SizedBox(height: 30),
                fieldName(_back),
                SizedBox(height: 15),
                fieldTelefone(_back),
                SizedBox(height: 15),
                fieldFoto(_back),
                SizedBox(height: 15),
                fieldReferencia(_back),
                SizedBox(height: 15),
                fieldData(_back),
                salvar(_back),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
