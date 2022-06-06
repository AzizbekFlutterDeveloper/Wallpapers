import 'package:dio/dio.dart';

class WallpapersServiceSearch {
  static Map<String, String> headers = {
    "Accept-Version": "v1",
    "Authorization": "Client-ID nSFokoapuHVHbKniNfO9CEg3UBbKV1UKirCL5z3w2DI"
  };
  static List data = [];
  static Future getDio(String search) async{
    Response res = await Dio().get("https://api.unsplash.com/search/photos?query=$search&per_page=20",options: Options(headers: headers));
    return res.data;
  }
  


}