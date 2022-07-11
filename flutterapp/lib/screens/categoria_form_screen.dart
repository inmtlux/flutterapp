import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/categoria.dart';
import '../providers/categoria_provider.dart';

class CategoriaFormScreen extends StatefulWidget {
  const CategoriaFormScreen({Key? key}) : super(key: key);

  @override
  State<CategoriaFormScreen> createState() => _CategoriaFormScreen();
}

enum Categoriaslist {
  terror,
  historia,
  romance,
  ficcion,
  literatura,
  fantasia,
  viajes,
  comics,
  cientifico,
  biografia,
  poetico,
  infantiles
} //categorias: terror historis etc

class _CategoriaFormScreen extends State<CategoriaFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtCategoriaId = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtCantidadLibros = TextEditingController();
  final txtImagen = TextEditingController();

  Categoriaslist? _catSeleccion = Categoriaslist.terror;
  bool? _estadoActivo = false;
  bool formModificado = false;
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
                  'api-sliderin.herokuapp.com', '/api/upload/categorias/' + id),
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
    final categoriaProvider = Provider.of<CategoriaProvider>(context);

    //RECIBIENDO EL PRODUCTO POR ARGUMENTO
    final Categoria? categoria =
        ModalRoute.of(context)!.settings.arguments as Categoria?;
    if (!formModificado) {
      if (categoria != null) {
        //EDITAR
        txtCategoriaId.text = categoria.categoriaId.toString();
        txtDescripcion.text = categoria.descripcion;
        txtCantidadLibros.text = categoria.cantidadlibros.toString();
        txtImagen.text = categoria.img;
        print(categoria.categoria);
        print(categoria.estado);
        if (categoria.categoria == 'Categoriaslist.terror') {
          _catSeleccion = Categoriaslist.terror;
        } else if (categoria.categoria == 'Categoriaslist.historia') {
          _catSeleccion = Categoriaslist.historia;
        } else if (categoria.categoria == 'Categoriaslist.romance') {
          _catSeleccion = Categoriaslist.romance;
        } else if (categoria.categoria == 'Categoriaslist.ficcion') {
          _catSeleccion = Categoriaslist.ficcion;
        } else if (categoria.categoria == 'Categoriaslist.literatura') {
          _catSeleccion = Categoriaslist.literatura;
        } else if (categoria.categoria == 'Categoriaslist.fantasia') {
          _catSeleccion = Categoriaslist.fantasia;
        } else if (categoria.categoria == 'Categoriaslist.viajes') {
          _catSeleccion = Categoriaslist.viajes;
        } else if (categoria.categoria == 'Categoriaslist.comics') {
          _catSeleccion = Categoriaslist.comics;
        } else if (categoria.categoria == 'Categoriaslist.cientifico') {
          _catSeleccion = Categoriaslist.cientifico;
        } else if (categoria.categoria == 'Categoriaslist.biografia') {
          _catSeleccion = Categoriaslist.biografia;
        } else if (categoria.categoria == 'Categoriaslist.poetico') {
          _catSeleccion = Categoriaslist.poetico;
        } else {
          _catSeleccion = Categoriaslist.infantiles;
        }
        _estadoActivo = (categoria.estado == 'true') ? true : false;
      } else {
        //NUEVO
        txtCategoriaId.text = '0';
        txtDescripcion.text = '';
        txtCantidadLibros.text = '';
        txtImagen.text = '';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE CATEGORIAS'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              readOnly: true,
              controller: txtCategoriaId,
              decoration: InputDecoration(
                  labelText: "CategoriaId",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              //maxLines: 8,
              //maxLength: 50,
              decoration: InputDecoration(
                  labelText: 'Breve descripcion',
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
                  labelText: 'Cantidad de libros recomendada...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtCantidadLibros,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una descripcion';
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
                        'Selecciona una imagen ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*TextFormField(
              decoration: InputDecoration(
                  labelText: 'Imagen',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtImagen,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una imagen';
                }
              },
            ),*/
            SizedBox(
              height: 1,
            ),
            Row(
                //boton para seleccionar categorias
                children: <Widget>[
                  Text('Categoria'),
                  SizedBox(
                    width: 10,
                  ),
                  Radio(
                      value: Categoriaslist.terror,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true; //PONER EN TODAS LAS CATEGORIAS
                        });
                      }),
                  Text('Terror'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.historia,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Historia'),
                ]),
            SizedBox(
              height: 1,
            ),
            Row(
                //boton para seleccionar categorias 2
                children: <Widget>[
                  SizedBox(
                    width: 73,
                  ),
                  Radio(
                      value: Categoriaslist.romance,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Romance'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.ficcion,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Ficción'),
                ]),
            //.........................
            /*SizedBox(
              height: 1,
            ),
            Row(
                //boton para seleccionar categorias 3
                children: <Widget>[
                  SizedBox(
                    width: 73,
                  ),
                  Radio(
                      value: Categoriaslist.literatura,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Literatura'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.fantasia,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Fantasia'),
                ]),
            SizedBox(
              height: 1,
            ),
            Row(
                //boton para seleccionar categorias 4
                children: <Widget>[
                  SizedBox(
                    width: 73,
                  ),
                  Radio(
                      value: Categoriaslist.viajes,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Viajes'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.comics,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Comics'),
                ]),*/
            SizedBox(
              height: 1,
            ),
            //....................................
            Row(
                //boton para seleccionar categorias 5
                children: <Widget>[
                  SizedBox(
                    width: 73,
                  ),
                  Radio(
                      value: Categoriaslist.cientifico,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Científico'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.biografia,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Biografía'),
                ]),
            SizedBox(
              height: 1,
            ),
            Row(
                //boton para seleccionar categorias 4
                children: <Widget>[
                  SizedBox(
                    width: 73,
                  ),
                  Radio(
                      value: Categoriaslist.poetico,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Poeticos'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.infantiles,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Infantiles'),
                ]),
            SizedBox(
              height: 1,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Valindado...')));

                    var categoria = Categoria(
                      id: '',
                      categoriaId: int.parse(txtCategoriaId.text),
                      descripcion: txtDescripcion.text,
                      cantidadlibros: txtCantidadLibros.text,
                      img: txtImagen.text,
                      categoria: _catSeleccion.toString(),
                      estado: _estadoActivo.toString(),
                    );

                    categoriaProvider.saveCategoria(categoria);

                    Navigator.pushReplacementNamed(
                        context, 'categorias2_screen');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
