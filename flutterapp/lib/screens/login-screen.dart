import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primera_prueba/palette.dart';
//import 'package:primera_prueba/screens/terr-cat-screen.dart';
import 'package:primera_prueba/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class LoginScreen extends StatelessWidget {
  // final _FormKey = GlobalKey<FormState>();
  final txtCorreo = TextEditingController();
  final txtPass = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    
    void ingresar(email, pass) async {
      try {
        var url = Uri.https('api-sliderin.herokuapp.com', '/api/auth');
        var response = await http.post(url, body: {
          'email': email,
          'password': password
        }).timeout(const Duration(seconds: 90));
        if (response.body == 'Bienvenido') {
          Navigator.pushReplacementNamed(context, 'principal_screen');
        } else {
          print('Usuario incorrecto');
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'SLIDERIN',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        Text(
                            'Email o contraseña incorrecto, vuelve a verificar tu datos', 
                            style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 39, 64, 176)) 
                      ),
                      child: Text('Aceptar',style: TextStyle(fontSize: 20)),
                     
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
        ;
      } catch (Error) {
        print(Error);
        print('http error');
      }
    }

    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/libros.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  //widget center para centrar el texto
                  child: Text(
                    //encima hemos creado otro widget hijo para centrar el texto
                    'Sliderin',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        //cuadro gris
                        height: size.height * 0.09,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.grey[500]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),

                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                //Todo el icono espacio etc
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 30,
                                  color: kWhite,
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText, //stilo de la letra
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            controller: txtCorreo,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      //cuadro gris
                      height: size.height * 0.09,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),

                      child: Center(
                        //creamos otro widget para el texto y centrar
                        child: TextFormField(
                          //texto del cuadro
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              //Todo el icono espacio etc
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                //ponemos un icono antes del texto
                                FontAwesomeIcons.lock,
                                size: 30, //tamaño del icono
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Contraseña',
                            hintStyle: kBodyText,
                          ),
                          obscureText:
                              true, //para que las letras tengan cifrado ***
                          style:
                              kBodyText, //stilo de la laetra que ira dentro del recuadro
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          controller: txtPass,
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, 'Olvido la contraseña'),
                    child: Text(
                      'Olvido la Contraseña',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: size.height * 0.09,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kBlue,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        email = txtCorreo.text;
                        password = txtPass.text;
                       
                       
                        ingresar(email, password);
                      
                      },
                      child: Text(
                        'Login',
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // RoundedButton(
                  //   buttonName: 'Login',
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'Crear_nueva_cuenta'),
                child: Container(
                  child: Text(
                    'Crear nueva cuenta',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
