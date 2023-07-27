import 'package:dio/dio.dart';
import 'package:movie_app/Api/dio_file.dart';
import 'package:movie_app/Api/model.dart';

class Repository{
  //ننعمل اوبجكت من الديو عشان الريبوزيتوري ياخد الداتا من الديو 
  DioHelper dioHelper =DioHelper();

  //ننجيب الداتا من الديو عن طريق دالة بتاخد مودل 
  Future<List<Model>>getCharacterData()async{
    Response response =await dioHelper.getAllCharacters(path: 'character');
    List result =response.data['results'];
    return result.map((e) => Model.fromJson(e)).toList();
  }
}