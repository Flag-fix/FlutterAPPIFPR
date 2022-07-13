
import 'package:dio/dio.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/controller/DioConfig.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/interfaces/cavalo_dao.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';

class CavaloDaoApi implements CavaloDao{

  String path = "cavalos";

  @override
  Future<List<NewCavalo>> find() async{
    try{
      var dio = DioConfig.builderConfig();
      final Response response = await dio.get(path);
      if(200 == response.statusCode){
        var result = (response.data as List).map((item) {
          return NewCavalo.fromJson(item);
        }).toList();
        return result;
      }else{
        return <NewCavalo>[];
      }
    }catch(e){
      return <NewCavalo>[];
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
  save(NewCavalo cavalo) async{
    try{
      var dio = DioConfig.builderConfig();
      if(cavalo.id == null){
        await dio.post(path, data: cavalo.toJson());
      }else{
        String pathMethod = path+"/"+cavalo.id.toString();
        await dio.put(pathMethod, data: cavalo.toJson());
      }
    }on DioError catch (e){
      return e;
    }
  }

}