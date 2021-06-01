import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/data/data.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/pessoa.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PessoaForm extends StatefulWidget {
  @override
  _PessoaFormState createState() => _PessoaFormState();
}

class _PessoaFormState extends State<PessoaForm> {
  final _form = GlobalKey<FormState>();

  DateTime currentDate;

  var tel = MaskTextInputFormatter(mask: '(##) # ####-####');
  var ref = MaskTextInputFormatter(mask: 'Ref-######');

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
      return 'Selecione uma Data';
    } else {
      return DateFormat('dd/MM/yyyy').format(currentDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    Pessoa _contact = new Pessoa();
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Contato'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  _form.currentState.save();
                  if (_contact.nome.isNotEmpty) {
                    lista.add(_contact);
                    _contact = Pessoa();
                  }
                  Navigator.of(context).pushNamed('lista');
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                      onSaved: (value) => _contact.nome = value,
                      decoration: InputDecoration(
                          labelText: 'Insira um Nome:',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)))),
                  SizedBox(height: 15),
                  TextFormField(
                      onSaved: (value) => _contact.contato = value,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [tel],
                      decoration: InputDecoration(
                          labelText: 'Telefone',
                          hintText: '(99) 9999-9999',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)))),
                  SizedBox(height: 15),
                  TextFormField(
                      onSaved: (value) => _contact.foto = value,
                      decoration: InputDecoration(
                          labelText: 'URL',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)))),
                  SizedBox(height: 15),
                  TextFormField(
                      onSaved: (value) => _contact.referencia = value,
                      inputFormatters: [ref],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Insira uma referencia',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)))),
                  SizedBox(height: 15),
                  TextFormField(
                    onTap: () {
                      _selectDate(context);
                      FocusScope.of(context).requestFocus(new FocusNode());
                      print(context);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: getText()),
                    onSaved: (value) {
                      _contact.data = value;
                      print(value);
                    },
                  ),
                ],
              )),
        ));
  }
}
