

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/models/libro_response.dart';
import "package:http/http.dart" as http;


class LibroProvider extends ChangeNotifier{
  String _baseUrl = 'api-sliderin.herokuapp.com';
  //String _baseUrl = "localhost:8080";

  List<Libro> listaLibrosNovedades = [];
  List<Libro> listaLibrosPopulares = [];
  List<Libro> listaLibros = [];
  List<Libro> listaLibrosTerror = [];
  List<Libro> listaLibrosTerrPo = [];
  

  LibroProvider(){
    print('Ingresando a Libro Provider');
    this.getLibrosNovedades();
    this.getLibrosPopulares();
    this.getLibros();
    this.getLibrosTerror();
    this.getLibrosTerPo();
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

  getLibrosTerror() async {
    final queryParameters = {
       'limite':'5',
      'desde':'5'
    };
    var url = Uri.http(_baseUrl, '/api/libros/terror',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosTerror = libroResponse.libro;
    notifyListeners();
  }

  getLibrosTerPo() async {
     final queryParameters = {
       'limite':'5',
    };

    var url = Uri.http(_baseUrl, '/api/libros/terror',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosTerrPo = libroResponse.libro;
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
  getLibros() async {
    final queryParameters = {
       'limite':'5',
    };

    var url = Uri.http(_baseUrl, '/api/libros',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibros = libroResponse.libro;
    notifyListeners();
  }
  saveLibros(Libro libro) async {
    var url = Uri.http(_baseUrl, "/api/libros/save");
    print(libro.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: libro.toJson());
    print(response.body);
    getLibros();
    notifyListeners();
  }
}