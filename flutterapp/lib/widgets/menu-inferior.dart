
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuInferior extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MenuInferior();
}
class _MenuInferior extends State<MenuInferior>{
  int _pagina_actual = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      onTap: (index){
          setState(() {
            _pagina_actual = index;
            if(_pagina_actual == 0){
              Navigator.pushReplacementNamed(context, 'principal_screen');
            }
            if(_pagina_actual == 1){
              Navigator.pushReplacementNamed(context, 'categorias_screen');
            }
            if(_pagina_actual == 2){
              Navigator.pushReplacementNamed(context, '/');
            }
          });
        },
      currentIndex: _pagina_actual,
      items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            
            icon: Icon(Icons.account_circle_rounded),
            label: 'School',
            
          ),
          
      ],
      );
  }
}
