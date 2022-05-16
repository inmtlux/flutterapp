import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/inicio-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';


class PrincipalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen> {
  int _pagina_actual = 0;

  List<Widget> _paginas = [
    InicioScreen(),
    CategoriaScreen(),
    LoginScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SLIDERIN',
            style: TextStyle(color: Colors.black, fontSize: 30.0,fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        
      ),
      body: _paginas[_pagina_actual],
      
      bottomNavigationBar: BottomNavigationBar(
      onTap: (index){
          setState(() {
            _pagina_actual = index;
          });
        },
      currentIndex: _pagina_actual,
      items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.purple[900]),
            label: 'Inicio',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Colors.purple[900]),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            
            icon: Icon(Icons.account_circle_rounded, color: Colors.purple[900]),
            label: 'Perfil',
            
          ),
          
      ],
      ),
    );
  }
}
