import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/providers/libro_provider.dart';
import 'dart:io';

import 'dart:async';

import 'package:provider/provider.dart';

import '../widgets/menu_lateral.dart';

class LibroUpdateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LibroUpdateForm();
}

class _LibroUpdateForm extends State<LibroUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final txtId = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtAutor = TextEditingController();
  final txtImagen = TextEditingController();
  final txtCategoria = TextEditingController();
  File? imagen;
  String img = '';
  final picker = ImagePicker();

  Future setImage() async {
    var pickedFile;

    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
        print('========================');
        print(imagen!.path);
        print('========================');
      } else {
        print('No seleccionaste ninguna imagen');
      }
    });
  }

  Dio dio = new Dio();
  Future<void> subir_imagen(String id) async {
    try {
      String filename = imagen!.path.split('/').last;
      print('========================');
      print(filename);
      print('========================');

      FormData formData = new FormData.fromMap({
        'archivo':
            await MultipartFile.fromFile(imagen!.path, filename: filename)
      });

      await dio
          .putUri(
              Uri.http(
                  'api-sliderin.herokuapp.com', '/api/upload/libros/' + id),
              data: formData)
          .then((value) {
        print(value);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final libroProvider = Provider.of<LibroProvider>(context);
    final Libro? libro = ModalRoute.of(context)!.settings.arguments as Libro?;
    if (libro != null) {
      txtId.text = libro.libroId.toString();
      txtDescripcion.text = libro.descripcion;
      txtCategoria.text = libro.categoria;
      txtAutor.text = libro.autor;
      img = libro.img;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('ACTUALIZAR LIBRO'),
        ),
        drawer: MenuLateral(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Libro ID',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  controller: txtId,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa ID';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nombre del libro',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  controller: txtDescripcion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una descripcion';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Categoría...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  controller: txtCategoria,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una categoria';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Autor...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  controller: txtAutor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese el autor';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setImage();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: Text(
                            'Seleccionar una imagen ',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await subir_imagen(txtId.text);
                    libroProvider.getLibrosNovedades();
                    libroProvider.getLibrosPopulares();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.upload,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: Text(
                            'Cambiar imagen',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ElevatedButton(
                    child: const Text('GUARDAR'),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 18, 170, 97)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Validando...')));

                        var libro = Libro(
                          id: '',
                          libroId: int.parse(txtId.text),
                          categoria: txtCategoria.text,
                          descripcion: txtDescripcion.text,
                          autor: txtAutor.text,
                          img: img,
                        );
                        final rsp = await libroProvider.saveLibros(libro);
                        print('=========== Libro nuevo   =========');
                        print('Bienvenido ' + rsp['libro']['descripcion']);
                        String libroId =
                            await (rsp['libro']['libroId']).toString();

                        Navigator.pushNamed(
                            context, 'principal_screen');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
