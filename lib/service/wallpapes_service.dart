import 'package:dio/dio.dart';

class HttpService {
  static Map<String, String> headers = {
    "Accept-Version": "v1",
    "Authorization": "Client-ID nSFokoapuHVHbKniNfO9CEg3UBbKV1UKirCL5z3w2DI"
  };

  
  static Future getDio() async{
    Response res = await Dio().get("https://api.unsplash.com/photos?per_page=10",options: Options(headers: headers));    
    return res.data;
  }
  


}