
import 'package:dio/dio.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/controller/DioConfig.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/interfaces/pessoa_dao.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';

class PessoaDaoApi implements PessoaDao{

  String path = "pessoas";

  @override
  Future<List<NewPessoa>> find() async{
    try{
      var dio = DioConfig.builderConfig();
      final Response response = await dio.get(path);
      if(200 == response.statusCode){
        var result = (response.data as List).map((item) {
          return NewPessoa.fromJson(item);
        }).toList();
        return result;
      }else{
        return <NewPessoa>[];
      }
    }catch(e){
      return <NewPessoa>[];
    }
  }

  @override
  remove(id) async{
    try{
      var dio = DioConfig.builderConfig();
      String pathMethod = path+"/"+id.toString();
      await dio.delete(pathMethod);
    }on DioError catch (e){
      return e;
    }


  }

  @override
  save(NewPessoa pessoa) async{
    try{
      var dio = DioConfig.builderConfig();
      if(pessoa.id == null){
        await dio.post(path, data: pessoa.toJson());
      }else{
        String pathMethod = path+"/"+pessoa.id.toString();
        await dio.put(pathMethod, data: pessoa.toJson());
      }
    }on DioError catch (e){
      return e;
    }
  }

}