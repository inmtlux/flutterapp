import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/categoria.dart';
import '../providers/categoria_provider.dart';

class CategoriaFormScreen extends StatefulWidget {
  const CategoriaFormScreen({Key? key}) : super(key: key);

  @override
  State<CategoriaFormScreen> createState() => _CategoriaFormScreen();
}

//enum Categorias { computo, sonido }

class _CategoriaFormScreen extends State<CategoriaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  //Categorias? _catSeleccion = Categorias.computo;
  // bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final categoriaProvider = Provider.of<CategoriaProvider>(context);
    final txtDescripcion = TextEditingController();
    final txtCantidadLibros = TextEditingController();

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
                  labelText: 'A que categoria pertenece...',
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
            /*Row(
              children: <Widget>[
                Text('Categoria'),
                SizedBox(
                  width: 20,
                ),
                Radio(
                  value: Categorias.computo, 
                  groupValue: _catSeleccion, 
                  onChanged: (value){
                    setState(() {
                      _catSeleccion = value as Categorias?;
                      print(_catSeleccion);
                    });
                  }
                ),
                Text('Computo'),
                SizedBox(
                  width: 15,
                ),
                Radio(
                  value: Categorias.sonido, 
                  groupValue: _catSeleccion, 
                  onChanged: (value){
                    setState(() {
                      _catSeleccion = value as Categorias?;
                      print(_catSeleccion);
                    });
                  }
                ),
                Text('Sonido'),
              ],
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
                  onChanged: (value){
                    setState(() {
                      _estadoActivo = value;
                      print('_estadoActivo: ${_estadoActivo}');
                    });
                  }
                ),
                Text('Activo')
              ],
            ),*/

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
                      cantidadlibros: txtCantidadLibros.text,
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
