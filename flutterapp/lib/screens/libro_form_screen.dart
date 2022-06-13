import 'package:flutter/material.dart';
import 'package:primera_prueba/models/producto.dart';
import 'package:primera_prueba/providers/libro_provider.dart';
import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/providers/producto_provider.dart';

import 'package:provider/provider.dart';

import '../widgets/menu_lateral.dart';



class LibroFormScreen extends StatefulWidget {
  const LibroFormScreen({Key? key}) : super(key: key);

  @override
  State<LibroFormScreen> createState() => _LibroFormScreen();
}

enum Autoreslist {
 literario,
 noliterario
} 

class _LibroFormScreen extends State<LibroFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Autoreslist? _catSeleccion = Autoreslist.literario;
  bool? _estadoActivo = false;

  final txtDescripcion = TextEditingController();
  final txtAutor = TextEditingController();
  final txtImagen = TextEditingController();
  final txtCategoria = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final libroProvider = Provider.of<LibroProvider>(context);
    

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE LIBROS'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
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
                        const SnackBar(content: Text('Validando...')));

                    var libro = Libro(
                      id: '',
                      libroId: 0,
                      categoria: txtCategoria.text,
                      descripcion: txtDescripcion.text,
                      autor: txtAutor.text,
                      img: txtImagen.text,
                      
                    );

                    libroProvider.saveLibros(libro);

                    Navigator.pushReplacementNamed(
                        context, 'terror1_screen');
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
