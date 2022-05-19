import 'package:flutter/material.dart';

import '../palette.dart';

class TextInputField extends StatelessWidget {

  const TextInputField( {
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
    Size size =MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(//cuadro gris
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
                icon,
                size: 30,
                color: kWhite,
              ),
            ),

            hintText: hint,
            hintStyle: kBodyText,
            
          ),
          style: kBodyText,//stilo de la letra
          keyboardType: inputType,
          textInputAction: inputAction,
          
          ),

        ),
      ),
    );
  }
}