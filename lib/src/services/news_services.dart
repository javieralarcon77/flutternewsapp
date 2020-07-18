import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsServices with ChangeNotifier{

  final _URL_NEWS = 'https://newsapi.org/v2';
  final _API_KEY = '1b9f1ac2c51f43dc961af717b0cd91f6';

  List<Article> headlines = [];

  NewsServices(){
    this.getTopHeadlines();
  }


  getTopHeadlines() async{
    print('Cargando headlines');
    
    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=co';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll( newsResponse.articles );
    
    notifyListeners();
  }

}