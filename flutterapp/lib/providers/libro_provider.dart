

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/models/libro_response.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;


class LibroProvider extends ChangeNotifier{
  String _baseUrl = 'api-sliderin.herokuapp.com';
  //String _baseUrl = "localhost:8080";

  List<Libro> listaLibrosNovedades = [];
  List<Libro> listaLibrosPopulares = [];
  List<Libro> listaLibros = [];
  List<Libro> listaLibrosTerror = [];
  List<Libro> listaLibrosTerrPo = [];
  List<Libro> listaLibrosFiccPo = [];
  List<Libro> listaLibrosFiccion = [];
  List<Libro> listaLibrosInfPo = [];
  List<Libro> listaLibrosInfantil = [];
  List<Libro> listaLibrosRomPo = [];
  List<Libro> listaLibrosRomance = [];
  

  LibroProvider(){
    print('Ingresando a Libro Provider');
    this.getLibrosNovedades();
    this.getLibrosPopulares();
    this.getLibros();
    this.getLibrosTerror();
    this.getLibrosTerPo();
    this.getLibrosFiccion();
    this.getLibrosFiccPo();
    this.getLibrosInfantil();
    this.getLibrosInfPo();
    this.getLibrosRomance();
    this.getLibrosRomPo();
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
    final terror = {
       'limite':'10',
      'desde':'5'
    };
    var url = Uri.http(_baseUrl, '/api/libros/terror',terror);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosTerror = libroResponse.libro;
    notifyListeners();
  }

  getLibrosTerPo() async {
     final queryParameters = {
       'limite':'10',
    };

    var url = Uri.http(_baseUrl, '/api/libros/terror',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroRSP = LibroResponse.fromJson(response.body);
    listaLibrosTerrPo = libroRSP.libro;
    notifyListeners();
  }

  getLibrosFiccPo() async {
     final queryParameters = {
       'limite':'10',
    };

    var url = Uri.http(_baseUrl, '/api/libros/ficcion',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroRSP = LibroResponse.fromJson(response.body);
    listaLibrosFiccPo = libroRSP.libro;
    notifyListeners();
  }

  getLibrosFiccion() async {
    final ficcion = {
       'limite':'10',
      'desde':'5'
    };
    var url = Uri.http(_baseUrl, '/api/libros/ficcion',ficcion);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosFiccion = libroResponse.libro;
    notifyListeners();
  }

  getLibrosRomPo() async {
     final queryParameters = {
       'limite':'10',
    };

    var url = Uri.http(_baseUrl, '/api/libros/romance',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroRSP = LibroResponse.fromJson(response.body);
    listaLibrosRomPo = libroRSP.libro;
    notifyListeners();
  }

  getLibrosRomance() async {
    final romance = {
       'limite':'10',
      'desde':'5'
    };
    var url = Uri.http(_baseUrl, '/api/libros/romance',romance);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosRomance = libroResponse.libro;
    notifyListeners();
  }

  getLibrosInfPo() async {
     final queryParameters = {
       'limite':'10',
    };

    var url = Uri.http(_baseUrl, '/api/libros/infantil',queryParameters);
    final response = await http.get(url);

    print(response.body);

    final libroRSP = LibroResponse.fromJson(response.body);
    listaLibrosInfPo = libroRSP.libro;
    notifyListeners();
  }

  getLibrosInfantil() async {
    final infantil = {
       'limite':'10',
      'desde':'5'
    };
    var url = Uri.http(_baseUrl, '/api/libros/infantil',infantil);
    final response = await http.get(url);

    print(response.body);

    final libroResponse = LibroResponse.fromJson(response.body);
    listaLibrosInfantil = libroResponse.libro;
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
    
    var url = Uri.http(_baseUrl, '/api/libros');
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
    // print(response.body);
    final jsonRsp = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print('=========== Libro nuevo   =========');
    print(jsonRsp['libro']['descripcion']);
    print('=========== Libro nuevo   =========');
    // getLibros();
    getLibrosNovedades();
    getLibrosPopulares();
    notifyListeners();
    return jsonRsp;
  }

}