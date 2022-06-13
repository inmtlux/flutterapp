

import 'package:flutter/material.dart';

import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/models/libro_response.dart';
import "package:http/http.dart" as http;


class LibroProvider extends ChangeNotifier{
  String _baseUrl = 'localhost:8080';

  List<Libro> listaLibrosNovedades = [];
  List<Libro> listaLibrosPopulares = [];
  

  LibroProvider(){
    print('Ingresando a Libro Provider');
    this.getLibrosNovedades();
    this.getLibrosPopulares();
  }
  getLibrosNovedades() async {
    final queryParameters = {
       'limite':'5',
      'desde':'5'
    };
    var url = Uri.http(_baseUrl, '/api/libros',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosNovedades = libroResponse.libro;
    notifyListeners();
  }
  getLibrosPopulares() async {
     final queryParameters = {
       'limite':'5',
    };

    var url = Uri.http(_baseUrl, '/api/libros',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosPopulares = libroResponse.libro;
    notifyListeners();
  }
  getlibrosTerro() async{

  }
}