import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:primera_prueba/models/usuario.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/inicio-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:provider/provider.dart';

class UsuSwiper extends StatefulWidget {
  @override
  State<UsuSwiper> createState() => _UsuSwisperState();
}

class _UsuSwisperState extends State<UsuSwiper> {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Usuario> listaUsuarios = usuarioProvider.listaUsuarios;
    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, 'Crear nueva cuenta');
                  },
                ),
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 160,
                backgroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Usuarios',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  background: ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(rect),
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/libros.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Swiper(
                    itemCount: listaUsuarios.length,
                    layout: SwiperLayout.TINDER,
                    itemWidth: size.width * 0.8,
                    itemHeight: size.height * 0.46,
                    itemBuilder: (BuildContext context, int index) {
                      return _cardUsuario(listaUsuarios[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget imagenUsuario({required Usuario usuario}) {
//   if (usuario.img == "") {
//     return Image(
//       image: AssetImage(
//         'assets/user.jpg',
//       ),
//       height: 100,
//       width: 100,
//       fit: BoxFit.cover,
//     );
//   } else {
//     return Image(
//       image: NetworkImage(
//         usuario.img,
//       ),
//       height: 100,
//       width: 100,
//       fit: BoxFit.cover,
//     );
//   }
// }

class _cardUsuario extends StatelessWidget{
  final Usuario usuario;
  _cardUsuario(this.usuario);
  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top:0,bottom: 0),
      width: double.infinity,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _ImagenFondo(usuario),
          _EtiquetaNombre(usuario)
        ],
      ),
    );
  }
}
BoxDecoration _cardBorders()=> BoxDecoration(
  //  color: Colors.white,
   borderRadius: BorderRadius.circular(25),
   boxShadow: [
     BoxShadow(
       color: Colors.black12,
       offset: Offset(0,7),
       blurRadius: 10,
     )
   ]
 );
class _ImagenFondo extends StatelessWidget{

    final Usuario usuario;
    _ImagenFondo(this.usuario);

    @override
    Widget build(BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          height: 400,
          child: FadeInImage(
            placeholder: AssetImage('assets/pajaros.jpg'), 
            image: NetworkImage(usuario.img),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

class _EtiquetaNombre extends StatelessWidget{

    final Usuario usuario;
    _EtiquetaNombre(this.usuario);
    @override
    Widget build(BuildContext context) {
      return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,//quitar
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
              )
            ),
            child: ListTile(
              title: Text(usuario.nombre,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ),
              subtitle: Text(
                usuario.email.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: (){
                  Navigator.pushNamed(context, 'Crear_nueva_cuenta',arguments: usuario);
                },
              ),
            ),
          );
    }
} 
