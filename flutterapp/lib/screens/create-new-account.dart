import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primera_prueba/palette.dart';
import 'package:primera_prueba/widgets/background-image.dart';
import 'package:primera_prueba/widgets/widgets.dart';

class CreateNewAccount extends StatelessWidget {
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
                  Positioned(
                    top: size.height * 0.6,
                    left: size.width * 0.56,
                    child: Container(
                      height: size.width * 0.1,
                      width: size.width * 0.1,
                      decoration: BoxDecoration(
                        color: kBlue,
                        shape: BoxShape.circle,
                        border: Border.all(color: kWhite,width: 1),
                      ),
                      child: Icon(FontAwesomeIcons.arrowUp,
                      color: kWhite,
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(
                height: size.width*0.1,
              ),
              Column(
                children:[
                  TextInputField(icon: FontAwesomeIcons.user, 
                  hint: 'Usuario', 
                  inputType: TextInputType.name, 
                  inputAction: TextInputAction.next
                  ),
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Correo',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(icon: FontAwesomeIcons.lock, 
                  hint: 'Contraseña', 
                  inputAction: TextInputAction.next, 
                  inputType: TextInputType.visiblePassword,
                  ),
                  PasswordInput(icon: FontAwesomeIcons.lock, 
                  hint: 'Confirma Contraseña', 
                  inputAction: TextInputAction.done, 
                  inputType: TextInputType.visiblePassword,
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