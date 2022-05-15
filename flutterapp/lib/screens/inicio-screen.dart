import 'package:flutter/cupertino.dart';

class InicioScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CategoriaScreen();
}

class _CategoriaScreen extends State<InicioScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Center(
          child: Container(
            child: Text('Inicio', style: TextStyle(fontSize: 20.0),),
          ),
      );
}}