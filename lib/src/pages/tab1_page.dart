import 'package:flutter/material.dart';
import 'package:newsapp/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_services.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsServices>(context).headlines;

    return Scaffold(
      body: ( headlines.length == 0 )
        ? Center( child: CircularProgressIndicator() )
        : NewsList( headlines ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}