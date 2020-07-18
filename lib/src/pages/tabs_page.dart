import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _NavegacionModel(), //creacion de la instancia del provider (se necesita el widget ChangeNotifierProvider)
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    //obtencion del provider en un hijo
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
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

//implementacion de un provider de tipo notificador
class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  set paginaActual (int valor) {
    this._paginaActual = valor;
    notifyListeners();
    // ???
  }

}