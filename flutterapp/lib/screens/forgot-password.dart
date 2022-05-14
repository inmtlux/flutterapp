

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primera_prueba/palette.dart';
import 'package:primera_prueba/widgets/background-image.dart';
import 'package:primera_prueba/widgets/rounded-button.dart';
import 'package:primera_prueba/widgets/text-input-field.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/libros.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kWhite,
              ),
          ),
          title: Text(
            'Olvidaste la contraseña',
            style: kBodyText,
            ),
            centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    child: Text('Ingresa tu correo electronico le enviaremos instrucciones para resetear su contraseña',
                    style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                  icon: FontAwesomeIcons.envelope,
                  hint: 'Correo',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(buttonName: 'Enviar')
                ],
              ),
            )
          ],
        ),
        ),
      ],
    );
  }
}