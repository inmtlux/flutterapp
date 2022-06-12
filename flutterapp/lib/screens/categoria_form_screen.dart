import 'package:flutter/material.dart';
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
  Categoriaslist? _catSeleccion = Categoriaslist.terror;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final categoriaProvider = Provider.of<CategoriaProvider>(context);
    final txtDescripcion = TextEditingController();
    final txtCantidadLibros = TextEditingController();
    final txtImagen = TextEditingController();

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
              //maxLines: 8,
              //maxLength: 50,
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
            TextFormField(
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
                        });
                      }),
                  Text('Historia'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.romance,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
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
                        });
                      }),
                  Text('Ficción'),
                ]),
            //.........................
            SizedBox(
              height: 10,
            ),
            Row(
                //boton para seleccionar categorias 2
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
                        });
                      }),
                  Text('Fantasia'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.viajes,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
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
                        });
                      }),
                  Text('Comics'),
                ]),
            SizedBox(
              height: 10,
            ),
            //....................................
            Row(
                //boton para seleccionar categorias 2
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
                        });
                      }),
                  Text('Biografía'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categoriaslist.poetico,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                        });
                      }),
                  Text('Poético'),
                  SizedBox(
                    width: 10,
                  ),
                  Radio(
                      value: Categoriaslist.infantiles,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categoriaslist?;
                          print(_catSeleccion);
                        });
                      }),
                  Text('Infantil'),
                ]),
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
                        const SnackBar(content: Text('Valindado...')));

                    var categoria = Categoria(
                      id: '',
                      categoriaId: 0,
                      descripcion: txtDescripcion.text,
                      cantidadlibros: int.parse(txtCantidadLibros.text),
                      imagen: txtImagen.text,
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
