import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario.dart';
import "package:http/http.dart" as http;
import 'dart:io';
import '../models/usuario_response.dart';

class UsuarioProvider extends ChangeNotifier{

  String _baseUrl = 'localhost:8080';

  List<Usuario> listaUsuarios = [];

  UsuarioProvider(){
    print('Ingresando a usuarioprovider');
    this.getOnUsuarioList();
  }

  getOnUsuarioList() async{
    var url = Uri.http(_baseUrl, '/api/usuarios',{});
    final response = await http.get(url);
    print(response.body);
    final usuarioResponse = UsuarioResponse.fromJson(response.body);
    listaUsuarios = usuarioResponse.usuario;
    notifyListeners();
  }
}