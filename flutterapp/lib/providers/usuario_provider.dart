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

  saveUsuario(Usuario usuario) async{
    var url = Uri.http(_baseUrl, '/api/usuarios/save');
    print(usuario.toJson());
    final response = await http.post(url,
                                     headers: {HttpHeaders.contentTypeHeader:'application/json'},
                                     body: usuario.toJson()                                     
    );
    print(response.body);
    getOnUsuarioList();
    notifyListeners();
  }
}