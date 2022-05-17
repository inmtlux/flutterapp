import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/producto.dart';
import '../providers/producto_provider.dart';

class ProductoFormScreen extends StatefulWidget {
  const ProductoFormScreen({Key? key}) : super(key: key);

  @override
  State<ProductoFormScreen> createState() => _ProductoFormScreen();
}

enum Categorias { libros, colecciones }

class _ProductoFormScreen extends State<ProductoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Categorias? _catSeleccion = Categorias.libros;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final txtDescripcion = TextEditingController();
    final txtPrecio = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTRO DE PRODUCTOS"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              // maxLines: 1, // tamaño de casilla de relleno
              // maxLength: 50, //max cantidad de letras
              decoration: InputDecoration(
                labelText: "Descripcion",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              controller: txtDescripcion,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Por favor ingrese una descripcion";
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Precio",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                controller: txtPrecio,
                validator: (value) {
                  return "Por favor ingrese un precio";
                }),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text("Categoria"),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: Categorias.libros,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    }),
                Text("Libros"),
                SizedBox(
                  height: 15,
                ),
                Radio(
                    value: Categorias.colecciones,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      _catSeleccion = value as Categorias?;
                      print(_catSeleccion);
                    }),
                Text("Colecciones"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text("Estado"),
                SizedBox(
                  width: 20,
                ),
                Checkbox(
                    value: _estadoActivo,
                    onChanged: (value) {
                      setState(() {
                        _estadoActivo = value;
                        print("_estadoActivo: ${_estadoActivo}");
                      });
                    }),
                Text("Activo"),
              ],
            ),
            Container(
              child: ElevatedButton(
                child: const Text("GUARDAR"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Validando...")));

                    var producto = Producto(
                        id: "",
                        productoId: 0,
                        descripcion: txtDescripcion.text,
                        precio: txtPrecio.text);

                    productoProvider.saveProducto(producto);
                    Navigator.pushReplacementNamed(context, "ruta_productos");
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
