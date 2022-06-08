import 'package:dio/dio.dart';
import 'package:wallpapers/model/wallpaper_model.dart';

class WallpapersServiceSearch {
  static Map<String, String> headers = {
    "Accept-Version": "v1",
    "Authorization": "Client-ID nSFokoapuHVHbKniNfO9CEg3UBbKV1UKirCL5z3w2DI"
  };
  static Future getDio(String search) async{
    Response res = await Dio().get("https://api.unsplash.com/search/photos?query=$search&per_page=10",options: Options(headers: headers));
    List data = await Map<String, dynamic>.from(res.data)['results'];
    return (data).map((e) => Post.fromJson(e)).toList();
  }
}