import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 22, 21, 21),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Usuario'), 
            accountEmail: Text('cuenta'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network('https://st.depositphotos.com/1814084/1639/i/600/depositphotos_16398251-stock-photo-brad-pitt.jpg',
                width: 72,
                height: 72,
                fit: BoxFit.cover,),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                image: NetworkImage('https://www.dondeir.com/wp-content/uploads/2021/06/paginas-para-descargar-libros-gratis-y-legales-portada-1024x767.jpg'),
                fit: BoxFit.cover
              )
            ),
            ),
          
          
          ListTile(
            leading: Icon(Icons.home,color: Colors.grey),
            title: Text('Inicio',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, 'principal_screen');
            },
          ),

          ListTile(
            leading: Icon(Icons.book_sharp,color: Colors.grey),
            title: Text('Categorias',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, 'categorias_screen');
            },
          ),

          ListTile(
            leading: Icon(Icons.supervised_user_circle,color: Colors.grey),
            title: Text('Perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, 'principal_screen');
            },
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app,color: Colors.grey),
            title: Text('Cerrar Sesion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}