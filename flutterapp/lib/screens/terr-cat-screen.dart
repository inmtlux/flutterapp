import 'package:flutter/material.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';

class TerrorScreen extends StatefulWidget {
  TerrorScreen({Key? key}) : super(key: key);

  @override
  State<TerrorScreen> createState() => _TerrorScreenState();
}

class _TerrorScreenState extends State<TerrorScreen> {

   List<List> Terror = [
    [
      "El bazar de los malos sueños",
      "../assets/terror-screen/1.jpg",
    ],
    ["El quinto hijo", "../assets/terror-screen/4.jpg"],
    ["It", "../assets/terror-screen/5.jpg"],
    ["La semilla del diablo", "../assets/terror-screen/8.jpg"],
    ["Informe sobre ciegos", "../assets/terror-screen/9.jpg"],
  ];
  List<List> LJSmith = [
    ["Despertar: The vampires diaries", "../assets/terror-screen/cro1.jpg"],
    ["Conflicto: The vampires diaries", "../assets/terror-screen/cro2.jpg"],
    ["Furia: The vampires diaries", "../assets/terror-screen/cro3.jpg"],
    ["Invocación : The vampires diaries", "../assets/terror-screen/cro4.jpg"],
  ];
  List<List> SKing = [
    ["Cementario de animales", "../assets/terror-screen/sk1.jpg"],
    ["Billy Summers", "../assets/terror-screen/sk2.jpg"],
    ["It", "../assets/terror-screen/5.jpg"],
    ["El visitante", "../assets/terror-screen/sk4.jpg"],
    ["El misterio de Salem's Lot", "../assets/terror-screen/sk.jpg"],
    [
      "El bazar de los malos sueños",
      "../assets/terror-screen/1.jpg",
      "Stephen King"
    ],
  ];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          //drawer: TerrorScreen(),
          backgroundColor:Colors.black,
          body: CustomScrollView(
            slivers: <Widget>[
    SliverAppBar( 
      /*leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
      onPressed: (){
        Navigator.pushReplacementNamed(context, 'Crear nueva cuenta');
      },),*/
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 160,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      flexibleSpace: FlexibleSpaceBar(
        title: Text('HORROR',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        background: ShaderMask(
          shaderCallback: (rect) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent],
              ).createShader(rect),
              blendMode: BlendMode.darken,
          child: Container(decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/oscuro.jpg'),
            fit: BoxFit.cover,
            ),
          ),
          ),
        ),
      ),
    ),
    SliverFillRemaining(
      child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('TERROR',
                  style: TextStyle(fontSize: 25, color: Colors.grey[850])),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 230,
                child: ListView.builder(
                    itemCount: Terror.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final libro = Terror[index];
                      return Container(
                        height: 220,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              libro[1],
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                libro[0],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('L.J.SMITH',
                  style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontSize: 25,
                      color: Colors.grey[850])),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 230,
                child: ListView.builder(
                    itemCount: LJSmith.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final libro = LJSmith[index];
                      return Container(
                        height: 220,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              libro[1],
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                libro[0],
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('STEPHEN KING',
                  style: TextStyle(fontSize: 25, color: Colors.grey[850])),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 230,
                child: ListView.builder(
                    itemCount: SKing.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final libro = SKing[index];
                      return Container(
                        height: 220,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              libro[1],
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                libro[0],
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
          ]),
        ),
      ),
    ),
            ],
          ),
          drawer: MenuLateral(),
          ),
      ],
    );
  }
}