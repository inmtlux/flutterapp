import 'package:flutter/material.dart';

import '../palette.dart';

class ContainerField extends StatelessWidget {
  const ContainerField({
    Key? key, 
  }) : super(key: key);


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
      ),
    );
  }
}