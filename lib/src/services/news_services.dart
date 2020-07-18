import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsServices with ChangeNotifier{

  final _URL_NEWS = 'https://newsapi.org/v2';
  final _API_KEY = '1b9f1ac2c51f43dc961af717b0cd91f6';

  List<Article> headlines = [];

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business' ),
    Category( FontAwesomeIcons.tv, 'entertainment' ),
    Category( FontAwesomeIcons.addressCard, 'general' ),
    Category( FontAwesomeIcons.headSideVirus, 'health' ),
    Category( FontAwesomeIcons.vials, 'science' ),
    Category( FontAwesomeIcons.volleyballBall, 'sports' ),
    Category( FontAwesomeIcons.memory, 'technology' ),
  ];

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