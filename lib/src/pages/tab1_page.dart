import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_services.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsServices>(context);

    return Scaffold(
      body: Center(
        child: Text('Hola mundo'),
      ),
    );
  }
}