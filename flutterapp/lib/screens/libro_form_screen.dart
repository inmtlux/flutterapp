import 'package:flutter/material.dart';
import 'package:primera_prueba/models/producto.dart';
import 'package:primera_prueba/providers/libro_provider.dart';
import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/providers/producto_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'dart:async';

import 'package:provider/provider.dart';

import '../widgets/menu_lateral.dart';



class LibroFormScreen extends StatefulWidget {
  const LibroFormScreen({Key? key}) : super(key: key);

  @override
  State<LibroFormScreen> createState() => _LibroFormScreen();
}

class _LibroFormScreen extends State<LibroFormScreen> {
  final _formKey = GlobalKey<FormState>();


  final txtDescripcion = TextEditingController();
  final txtAutor = TextEditingController();
  final txtImagen = TextEditingController();
  final txtCategoria = TextEditingController();
  final txtLibroId= TextEditingController();
  bool? _estadoActivo = false;
  File? imagen;
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


    
    //RECIBIENDO EL PRODUCTO POR ARGUMENTO
    final Libro? libro =
        ModalRoute.of(context)!.settings.arguments as Libro?;
     /*if (!formModificado) {*/
      if (libro != null) {
        //EDITAR
        txtLibroId.text = libro.libroId.toString();
        txtDescripcion.text = libro.descripcion;
        txtCategoria.text = libro.categoria.toString();
        txtAutor.text = libro.autor.toString();
        txtImagen.text = libro.img;
        //print(libro.estado);
        //_estadoActivo = (libro.estado == 'true') ? true : false;
        
        } else {
        //NUEVO
        txtLibroId.text = '0';
        txtDescripcion.text = '';
        txtCategoria.text = '';
        txtAutor.text = '';
        txtImagen.text = '';
      }
     //}

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de libros'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[

            TextFormField(
              readOnly: true,
              controller: txtLibroId,
              decoration: InputDecoration(
                  labelText: "LibroId",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            SizedBox(
              height: 20,
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
              height: 20,
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
                        borderRadius: BorderRadius.circular(10)
                        ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(width: 25,),
                          Expanded(
                            child: Text(
                              'Seleccionar una imagen ',
                              style: TextStyle(fontSize: 18,color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('Estado'),
                SizedBox(
                  width: 20,
                ),
                Checkbox(
                    value: _estadoActivo,
                    onChanged: (value) {
                      setState(() {
                        _estadoActivo = value;
                        print('_estadoActivo: ${_estadoActivo}');
                      });
                    }),
                Text('Activo')
              ],
            ),
            Container(
              child: ElevatedButton(
                child: const Text('GUARDAR'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Validando...')));

                    var libro = Libro(
                      id: '',
                      libroId: 0,
                      categoria: txtCategoria.text,
                      descripcion: txtDescripcion.text,
                      autor: txtAutor.text,
                      img: txtImagen.text,
                      //estado: _estadoActivo.toString()
                      );
                      libroProvider.saveLibros(libro);
                     
                      
                    
                    Navigator.pushReplacementNamed(
                        context, 'registro_libros_screen');
                  }
                },
              ),
            )
          ]),
        ),
      ),
        drawer: MenuLateral(),
    );
  }
}
