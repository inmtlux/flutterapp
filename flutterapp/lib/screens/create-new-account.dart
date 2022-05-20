import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primera_prueba/palette.dart';
import 'package:primera_prueba/widgets/background-image.dart';
import 'package:primera_prueba/widgets/widgets.dart';

class CreateNewAccount extends StatelessWidget {
  final txtUser = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtPassConf = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/libros.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: size.width*0.1,
              ),
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4,
                        sigmaY: 4),
                        child: CircleAvatar(
                          radius: size.width * 0.14,
                          backgroundColor: Colors.grey[500]?.withOpacity(0.5),
                          child: Icon(FontAwesomeIcons.user,
                          color: kWhite,
                          size: size.width * 0.1,),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: size.width*0.1,
              ),
              Column(
                children:<Widget>[
        Container(//cuadro gris
        height: size.height * 0.09,
        width: size.width * 0.9,
        decoration: BoxDecoration(color: Colors.grey[500]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16)
        ),

        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
            border: InputBorder.none,

            prefixIcon: Padding(//Todo el icono espacio etc
              padding: const EdgeInsets.symmetric
              (horizontal: 20.0),
              child: Icon(
                Icons.person,
                size: 30,
                color: kWhite,
              ),
            ),


            hintText: ('Usuario'),
            hintStyle: kBodyText,
          ),

          controller: txtUser,

          style: kBodyText,//stilo de la letra
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          ),

        ),
      ),

      SizedBox(
        height: 10,
      ),
                    
                  

        Container(//cuadro gris
        height: size.height * 0.09,
        width: size.width * 0.9,
        decoration: BoxDecoration(color: Colors.grey[500]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16)
        ),

        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
            border: InputBorder.none,

            prefixIcon: Padding(//Todo el icono espacio etc
              padding: const EdgeInsets.symmetric
              (horizontal: 20.0),
              child: Icon(
                Icons.email,
                size: 30,
                color: kWhite,
              ),
            ),

            hintText: ('Correo'),
            hintStyle: kBodyText,
          ),

          controller: txtEmail,

          style: kBodyText,//stilo de la letra
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          ),

        ),
      ),

      SizedBox(
        height: 10,
      ),

        Container(//cuadro gris
        height: size.height * 0.09,
        width: size.width * 0.9,
        decoration: BoxDecoration(color: Colors.grey[500]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16)
        ),

        child: Center(//creamos otro widget para el texto y centrar
          child: TextField(//texto del cuadro
            decoration: InputDecoration(
            border: InputBorder.none,

            prefixIcon: Padding(//Todo el icono espacio etc
              padding: const EdgeInsets.symmetric
              (horizontal: 20.0),
              child: Icon(//ponemos un icono antes del texto
                Icons.block,
                size: 30,//tamaño del icono
                color: kWhite,
              ),
            ),

            hintText: ('Contraseña'),//para escribir el email
            hintStyle: kBodyText,
          ),

          controller: txtPassword,
          obscureText: true,//para que las letras tengan cifrado ***
          style: kBodyText,//stilo de la laetra que ira dentro del recuadro
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          ),
        ),
      ),

      SizedBox(height: 10,),

        Container(//cuadro gris
        height: size.height * 0.09,
        width: size.width * 0.9,
        decoration: BoxDecoration(color: Colors.grey[500]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16)
        ),

        child: Center(//creamos otro widget para el texto y centrar
          child: TextField(//texto del cuadro
            decoration: InputDecoration(
            border: InputBorder.none,

            prefixIcon: Padding(//Todo el icono espacio etc
              padding: const EdgeInsets.symmetric
              (horizontal: 20.0),
              child: Icon(//ponemos un icono antes del texto
                Icons.block,
                size: 30,//tamaño del icono
                color: kWhite,
              ),
            ),

            hintText: ('Contraseña'),//para escribir el email
            hintStyle: kBodyText,
          ),

          controller: txtPassConf,
          obscureText: true,//para que las letras tengan cifrado ***
          style: kBodyText,//stilo de la laetra que ira dentro del recuadro
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          ),
        ),
      ),

                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    height: size.height * 0.09,
                    width: size.width * 0.9,
                    decoration: 
                    BoxDecoration(borderRadius: 
                      BorderRadius.circular(16),
                    color: kBlue,
                    ),
                  child: FlatButton(
                    onPressed: (){},
                  child: Text(
                    'Create',
                    style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ya tienes una cuenta?',
                      style: kBodyText,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/');
                        },
                        child: Text('Ingresar',
                        style: kBodyText.copyWith(
                          color: kBlue,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ]
              )  
            ],
            ),
          ),
        )
      ],
    );
  }
}