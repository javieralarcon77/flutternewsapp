import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
    );
  }
}

class _Navegacion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem( icon: Icon( Icons.person_outline), title: Text('Para ti') ),
        BottomNavigationBarItem( icon: Icon( Icons.public), title: Text('Encabezado') )
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red
        ),
        
        Container(
          color: Colors.green
        ),
        
      ],
    );
  }
}