
import 'package:flutter/material.dart';


class CategoriaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CategoriaScreen();
}

class _CategoriaScreen extends State<CategoriaScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Center(
          child: Container(
            child: Text('categorias', style: TextStyle(fontSize: 20.0),),
          ),
      );
}}