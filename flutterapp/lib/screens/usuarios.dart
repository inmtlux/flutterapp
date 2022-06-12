import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/inicio-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:provider/provider.dart';

class UsuarioScreend extends StatefulWidget {
  @override
  State<UsuarioScreend> createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreend> {
  @override
  Widget build(BuildContext context) {

    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Usuario> listaUsuarios = usuarioProvider.listaUsuarios;

    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor:Colors.black,
          body: CustomScrollView(
            slivers: <Widget>[
    SliverAppBar(  
      leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
      onPressed: (){
        Navigator.pushReplacementNamed(context, 'Crear nueva cuenta');
      },),
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 160,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Usuarios',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        background: ShaderMask(
          shaderCallback: (rect) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent],
              ).createShader(rect),
              blendMode: BlendMode.darken,
          child: Container(decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/libros.jpg'),
            fit: BoxFit.cover,
            ),
          ),
          ),
        ),
      ),
    ),
    SliverFillRemaining(
      child:Padding(
        padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
        child: Container(
          child: Center(
            child: ListView.builder(
              itemCount: listaUsuarios.length,
              itemBuilder: (context, index){
                return Card(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(listaUsuarios[index].nombre,
                         style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),),
                        subtitle: Text(listaUsuarios[index].email,
                         style: TextStyle(
                          color: Colors.black),),
                        trailing: Container(
                          height: 300,
                          width: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: CircleAvatar(  
                                                  
                            child: ClipOval(
                              child: Image(image: NetworkImage(listaUsuarios[index].img,),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,),
                            )
                          ),
                        ),
                      ),
                        
                      ),
                    ],
                  ),
                );
              },
            )
          ),
        ),
      )
    ),
            ],
          ),
          ),
      ],
    );
  }
}