import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:primera_prueba/palette.dart';
//import 'package:primera_prueba/screens/cat-terror.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';

class CategoriaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoriasScreen();
}

class _CategoriasScreen extends State<CategoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 240, 236, 15),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.yellowAccent,
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 20),
                            Center(
                              child: Text("ROMANCE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.orange)),
                            )
                          ],
                        ),
                      ),
                      /*child: Ink.image(
                          image: AssetImage(
                              "../assets/categoria-screen/romanceprueba.jpg"),
                          fit: BoxFit.cover,
                        ),*/
                      /*child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                '../assets/categoria-screen/romanceprueba.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),*/
                      /* child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage(
                                "../assets/categoria-screen/romanceprueba.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),*/
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 77, 76, 76),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.white54,
                      onTap: () {
                        Navigator.pushNamed(context, "cat-terror");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 30),
                            Center(
                              child: Text("TERROR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white)),
                            )
                          ],
                        ),
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
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 139, 202, 239),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.lightBlue,
                      onTap: () {
                        Navigator.pushNamed(context, "cat-ficcion");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 30),
                            Center(
                              child: Text("FICCIÓN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.blue)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 138, 90, 193),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 158, 17, 190),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 164, 2, 192),
                              width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10),
                            Center(
                              child: Text("LITERATURA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 164, 2, 192))),
                            )
                          ],
                        ),
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
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 176, 123, 108),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 119, 64, 49),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 162, 47, 5), width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 20),
                            Center(
                              child: Text("FANTASÍA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 162, 47, 5))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 53, 62, 230),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 31, 44, 233),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 25, 5, 241), width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 40),
                            Center(
                              child: Text("VIAJES",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 25, 5, 241))),
                            )
                          ],
                        ),
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
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 185, 22, 22),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 212, 49, 49),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 225, 229, 19),
                              width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 35),
                            Center(
                              child: Text("COMICS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 234, 255, 1))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 98, 71, 3),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.white30,
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 215, 153, 6),
                              width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 25),
                            Center(
                              child: Text("HISTORIA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 215, 153, 6))),
                            )
                          ],
                        ),
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
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 15, 58, 12),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 44, 137, 30),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 5, 241, 12), width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 15),
                            Center(
                              child: Text("CIENTÍFICO",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 5, 241, 12))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 24, 61, 112),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 32, 39, 230),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 0, 199, 254),
                              width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 15),
                            Center(
                              child: Text("BIOGRAFÍA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 0, 199, 254))),
                            )
                          ],
                        ),
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
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 254, 169, 0),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 220, 148, 16),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 218, 242, 2),
                              width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 30),
                            Center(
                              child: Text("POÉTICA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 218, 242, 2))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 176,
                  child: Material(
                    color: Color.fromARGB(255, 43, 138, 173),
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 14, 24, 173),
                      onTap: () {
                        Navigator.pushNamed(context, ".....");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 2, 26, 242), width: 3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10),
                            Center(
                              child: Text("INFANTILES",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 2, 26, 242))),
                            )
                          ],
                        ),
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
              padding: EdgeInsets.only(left: 10),
              child: Text('DALE CLICK SI QUIERES SUGERIR UNA CATEGORIA...',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850])),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              //boton con texto e img
              //padding: EdgeInsets.only(left: 100),
              margin: EdgeInsets.only(left: 85),
              height: 60,
              width: 200,
              child: Material(
                color: Color.fromARGB(255, 3, 135, 23),
                borderRadius: BorderRadius.circular(30),
                clipBehavior: Clip.antiAliasWithSaveLayer, //click mas suave
                child: InkWell(
                  splashColor: Color.fromARGB(255, 96, 241, 56),
                  onTap: () {
                    Navigator.pushNamed(context, 'categorias2_screen');
                  },
                  /*child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: AssetImage(
                            "../assets/categoria-screen/sugerenciaCatg.jpg"),
                        height: 60,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Text("CLICK AQUI",
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                      SizedBox(width: 10),
                      Ink.image(
                        image: AssetImage(
                            "../assets/categoria-screen/sugerenciaCatg.jpg"),
                        height: 60,
                        width: 109,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),*/
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 0, 255, 38), width: 3),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 30),
                        Center(
                          child: Text("CLICK AQUÍ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
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
