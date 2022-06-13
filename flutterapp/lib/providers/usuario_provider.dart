import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario.dart';
import "package:http/http.dart" as http;
import 'package:primera_prueba/models/usuario_activo.dart';
import 'package:primera_prueba/models/usuario_activo_response.dart';
import 'package:primera_prueba/models/usuario_report.dart';
import 'package:primera_prueba/models/usuario_report_response.dart';
import 'dart:io';
import '../models/usuario_response.dart';

class UsuarioProvider extends ChangeNotifier{

  String _baseUrl = 'localhost:8080';

  List<Usuario> listaUsuarios = [];
  List<UsuarioActivo> listaUsuariosActivos = [];
  List<ReporteUsuario> listaUsuarioReport = [];

  UsuarioProvider(){
    print('Ingresando a usuarioprovider');
    this.getOnUsuarioList();
    this.reporteUsuariosActivos();
    this.reporteUsuario();
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
  reporteUsuariosActivos() async{
    var url = Uri.http(_baseUrl, '/api/reportes/usuariosActivos');
    final response = await http.get(url);
    final usuariosActivosResponse = UsuarioActivoResponse.fromJson(response.body);
    print(response.body);
    listaUsuariosActivos = usuariosActivosResponse.usuarioActivo;
   
    notifyListeners();
    
  }

  reporteUsuario()async{
    var url = Uri.http(_baseUrl, 'api//reportes/usuariosCate');
    final response = await http.get(url);
    final usuarioReportResponse = UsuarioReportResponse.fromJson(response.body);
    listaUsuarioReport = usuarioReportResponse.reporteUsuarios;
    notifyListeners();
  }
  
}