import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/pages/tabs_page.dart';
import 'package:newsapp/src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => NewsServices(), )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Material App',
        home: TabsPage(),
      ),
    );
  }
}