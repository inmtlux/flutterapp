import 'package:flutter/material.dart';
import 'package:primera_prueba/palette.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key, 
    required this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.9,
      decoration: 
          BoxDecoration(borderRadius: 
          BorderRadius.circular(16),
          color: kBlue,
          ),
      child: FlatButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, 'principal_screen');
        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
          ),),
    );
  }
}