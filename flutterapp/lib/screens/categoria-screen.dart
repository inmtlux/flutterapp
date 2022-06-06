import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:primera_prueba/screens/cat-terror.dart';

class CategoriaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoriasScreen();
}

class _CategoriasScreen extends State<CategoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('CATEGORIAS MAS VISITADAS',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850])),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            // 1ERA PARTE INICIO
            children: [
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.yellowAccent,
                    onTap: () {
                      Navigator.pushNamed(context, "cat-terror");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/romance.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.white54,
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/terror.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ), //FINAL 1ERA PARTE
          SizedBox(
            height: 10,
          ),
          Row(
            //2DA PARTE INICIO
            children: [
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.lightBlue,
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/ficcion.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 211, 236, 113),
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/literatura.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ), // 2DA PARTE FINAL
          SizedBox(
            height: 10,
          ),
          Row(
            //3ERA PARTE INICIO
            children: [
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 238, 145, 119),
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/fantasia2.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 15, 168, 234),
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/viajes.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ), // 3ERA PARTE FINAL
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('MAS CATEGORIAS....',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850])),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            // 1ERA PARTE INICIO
            children: [
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/comics.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.white30,
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/historia.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ), //FINAL 1ERA PARTE
          SizedBox(
            height: 10,
          ),
          Row(
            //2DA PARTE INICIO
            children: [
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/cientifico.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/biografia.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ), // 2DA PARTE FINAL
          SizedBox(
            height: 10,
          ),
          Row(
            //3ERA PARTE INICIO
            children: [
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 244, 236, 82),
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/poetico.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 130,
                width: 220,
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 15, 168, 234),
                    onTap: () {
                      Navigator.pushNamed(context, ".....");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/infantilesYjuvenil.jpg"),
                          height: 130,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ), // 3ERA PARTE FINAL
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text('DALE CLICK SI QUIERES SUGERIR UNA CATEGORIA...',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850])),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            //padding: EdgeInsets.only(left: 100),
            margin: EdgeInsets.only(left: 135),
            height: 130,
            width: 220,
            child: Material(
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                splashColor: Color.fromARGB(255, 136, 235, 24),
                onTap: () {
                  Navigator.pushNamed(context, 'categorias2_screen');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(
                      image: AssetImage(
                          "../assets/categoria-screen/sugerenciaCatg.jpg"),
                      height: 130,
                      width: 220,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// TODO: implement build
/*return   Center(
          child: Container(
            child: Text('categorias', style: TextStyle(fontSize: 20.0),),
          ),
      );
}}*/
