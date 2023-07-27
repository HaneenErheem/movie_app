import 'package:dio/dio.dart';

class DioHelper{
late Dio dio;
DioHelper(){
dio =Dio(
BaseOptions(
  baseUrl: 'https://rickandmortyapi.com/api/',
  sendTimeout:const Duration(seconds: 10),
  receiveTimeout:const Duration(seconds: 10)
)
);
}

Future<Response>getAllCharacters({required String path})async{
Response response =await dio.get(path);
return response;
}
}