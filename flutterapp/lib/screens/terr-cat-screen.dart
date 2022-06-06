import 'package:flutter/material.dart';

class TerrorScreen extends StatefulWidget {
  TerrorScreen({Key? key}) : super(key: key);

  @override
  State<TerrorScreen> createState() => _TerrorScreenState();
}

class _TerrorScreenState extends State<TerrorScreen> {
  @override
  Widget build(BuildContext context) {
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
            image: DecorationImage(image: AssetImage('assets/oscuro.jpg'),
            fit: BoxFit.cover,
            ),
          ),
          ),
        ),
      ),
    ),
    SliverFillRemaining(
      child: Container(),
    ),
            ],
          ),
          ),
      ],
    );
  }
}