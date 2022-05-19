import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/producto.dart';
import '../providers/producto_provider.dart';

class ProductoScreen extends StatefulWidget {
  @override
  createState() => _ProductoScreen();
}

class _ProductoScreen extends State<ProductoScreen> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<Producto> listaProductos = productoProvider.listaProductos;
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listaProductos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                listaProductos[index].descripcion,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              subtitle: Text(
                "S/." + listaProductos[index].precio.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              leading: Icon(Icons.card_giftcard),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "ruta_productos_form");
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}
