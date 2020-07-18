import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsServices with ChangeNotifier{

  final _URL_NEWS = 'https://newsapi.org/v2';
  final _API_KEY = '1b9f1ac2c51f43dc961af717b0cd91f6';

  List<Article> headlines = [];
  String _selectedCategory = 'business';

  Map<String,List<Article>> categoryArticles = {};

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

    categories.forEach((item) { 
      this.categoryArticles[item.name] = new List();
    });

  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory( String category ){
    this._selectedCategory = category;

    this.getArticlesByCategory(category);

    notifyListeners();
  }

  getTopHeadlines() async{
    print('Cargando headlines');
    
    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=co';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll( newsResponse.articles );
    
    notifyListeners();
  }

  getArticlesByCategory(String category) async{
    print('cargando articulos de ' + category);
    
    if(this.categoryArticles[category].length > 0)
      return this.categoryArticles[category];

    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=co&category=$category';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category].addAll( newsResponse.articles );
    notifyListeners();
  }

}