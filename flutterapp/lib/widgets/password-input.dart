import 'package:flutter/material.dart';

import '../palette.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key, 
    required this.icon, 
    required this.hint, 
    required this.inputType, 
    required this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(//cuadro gris
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
                icon,
                size: 30,//tamaño del icono
                color: kWhite,
              ),
            ),

            hintText: hint,//para escribir el email
            hintStyle: kBodyText,
          ),
          obscureText: true,//para que las letras tengan cifrado ***
          style: kBodyText,//stilo de la laetra que ira dentro del recuadro
          keyboardType: inputType,
          textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}