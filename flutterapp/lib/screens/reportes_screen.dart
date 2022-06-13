import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';

class ReporteScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ReporteScreen();
  }

class _ReporteScreen extends State<ReporteScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: ( AppBar(title: Text('REPORTES'),backgroundColor: Color.fromARGB(255, 41, 76, 233),)),
      drawer: MenuLateral(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ListView(
            children: [
              ListTile(
                
                title: Text('Reporte usuarios activos', 
                style: TextStyle(
                  color: Colors.white),
                  
                  ),
                
                onTap: (){
                  Navigator.pushReplacementNamed(context, 'usuarios_activos_reportes');
                },
                tileColor: Color.fromARGB(255, 41, 76, 233,),
                
                
              ),
              SizedBox(height: 30,),
              ListTile(
                title: Text('Reporte libros',
                style: TextStyle(
                  color: Colors.white),
                  ),
                onTap: (){},
                tileColor: Color.fromARGB(255, 41, 76, 233),
              )
            ],
          ),)
      ),
    );
  }
}
