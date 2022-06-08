import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:wallpapers/model/wallpaper_model.dart';


class HttpService {
  // https://api.unsplash.com/photos/?client_id=SGvm8KCgoAUBo9DQLWKVeCBfP8HZe1yZr5OOUPnUanA&per=1&per_page=20
  // Base url https://api.unsplash.com/photos/?client_id=SGvm8KCgoAUBo9DQLWKVeCBfP8HZe1yZr5OOUPnUanA
  static String BASE_URL = "api.unsplash.com";

  // Header
  static Map<String, String> headers = {
    "Accept-Version": "v1",
    "Authorization": "Client-ID nSFokoapuHVHbKniNfO9CEg3UBbKV1UKirCL5z3w2DI"
  };

  // Apis
  static String API_TODO_LIST = "/photos";
  static String API_TODO_ONE = "/photos"; // {ID}
  static String API_TODO_SEARCH = "/search/photos";

  // Methods
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    print("\n\nURL => ${uri}");
    Response response = await get(uri, headers: headers);
    if (kDebugMode) {
      print("\n\n\nHello http $params => ${response.body}");
    }
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  static Map<String, String> paramsSearch(int pageNumber,String query) {
    Map<String, String> params = {};
    params.addAll({
      "page":pageNumber.toString(),
      "query":query.toString()
    });
    return params;
  }

  static Map<String, String> paramsPage(int pageNumber, int number) {
    Map<String, String> params = {};
    params.addAll({
      "page":pageNumber.toString(),
      "per_page":number.toString(),
    });
    return params;
  }

  // Params
  static Map<String, String> paramEmpty() {
    Map<String, String> map = {};
    return map;
  }

  /* Http parsing */
  /* Http parsing */
  static List<Post> parseResponse(String response) {
    List json = jsonDecode(response);
    List<Post> photos = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return photos;
  }

  static List<Post> parseSearchParse(String response) {
    Map<String, dynamic> json = jsonDecode(response);
    List<Post> photos = List<Post>.from(json["results"].map((x) => Post.fromJson(x)));
    return photos;
  }
  

}