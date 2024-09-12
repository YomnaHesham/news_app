import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news_data_response.dart';
import 'package:news/models/sources_response.dart';

class ApiManager {
  //GET https://newsapi.org/v2/top-headlines/sources?apiKey=7ecb65909e734bba85c740251ef71418

  static Future<SourcesResponse> getSource(String categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "7ecb65909e734bba85c740251ef71418",
      "category": categoryId,
    });

    http.Response response = await http.get(url);

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonFormat);

    return sourcesResponse;
  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=7ecb65909e734bba85c740251ef71418
  static Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "7ecb65909e734bba85c740251ef71418", "sources": sourceId});

    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);

    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);

    return newsDataResponse;
  }
}
