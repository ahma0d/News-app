import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;
  static init()// to create object of dio
  {
   dio=Dio(
     BaseOptions(
       baseUrl: 'https://newsapi.org/',
       receiveDataWhenStatusError: true,//لو حصل خطء و الداتا راجعة

     ),

   );
  }
 static Future<Response> getData({
  required String url,
  required  query,
})async{
    return await dio.get(url,queryParameters:query,);//path هو الميثود
  }
}