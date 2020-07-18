import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsServices with ChangeNotifier{
  List<Article> headlines = [];

  NewsServices(){
    this.getTopHeadlines();
  }


  getTopHeadlines() async{
    print('Cargando headlines');
  }

}