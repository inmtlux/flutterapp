
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primera_prueba/models/usuario.dart';
import 'package:primera_prueba/palette.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/screens/terr-cat-screen.dart';
import 'package:primera_prueba/widgets/background-image.dart';
import 'package:provider/provider.dart';

class CreateNewAccounte extends StatefulWidget {
  CreateNewAccounte({Key? key}) : super(key: key);

  @override
  State<CreateNewAccounte> createState() => _CreateNewAccounteState();
}

class _CreateNewAccounteState extends State<CreateNewAccounte> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
     
     final txtUser = TextEditingController();
    final txtEmail = TextEditingController();
    final txtPassword = TextEditingController();
    final txtPassConf = TextEditingController();
    return Stack(
      children: [
        BackgroundImage(image: 'assets/libros.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 56,
              ),
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4,
                        sigmaY: 4),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.grey[500]?.withOpacity(0.5),
                          child: Icon(FontAwesomeIcons.user,
                          color: kWhite,
                          size: 45),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: 40,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children:<Widget>[
                      Container(//cuadro gris
                      height: 56,
                      width: 450,
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
                        /*validator: (value){
                          if(value!.isEmpty){
                            return 'Porfavor ingrese un usuario';
                          }
                        },*/
              
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
                      height: 56,
                      width: 450,
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
                        /*validator: (value){
                          if(value!.isEmpty){
                            return 'Porfavor ingrese un correo';
                          }
                        },*/
              
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
                      height: 56,
                      width: 450,
                      decoration: BoxDecoration(color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16)
                      ),
              
                      child: Center(//creamos otro widget para el texto y centrar
                        child: TextFormField(//texto del cuadro
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
                        /*validator: (value){
                          if(value!.isEmpty){
                            return 'Porfavor ingrese una contraseña';
                          }
                        },*/
                        
                        obscureText: true,//para que las letras tengan cifrado ***
                        style: kBodyText,//stilo de la laetra que ira dentro del recuadro
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        ),
                        
                      ),
                    ),
              
                    SizedBox(height: 10,),
              
                      Container(//cuadro gris
                      height: 56,
                      width: 450,
                      decoration: BoxDecoration(color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16)
                      ),
              
                      child: Center(//creamos otro widget para el texto y centrar
                        child: TextFormField(//texto del cuadro
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
                        validator: (value){
                          if(txtPassConf == '${txtPassword}'){
                            return 'Porfavor confirmar contraseña';
                          }
                        },
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
                      height: 56,
                      width: 450,
                      decoration: 
                      BoxDecoration(borderRadius: 
                        BorderRadius.circular(16),
                      color: kBlue,
                      ),
                    child: FlatButton(
                      onPressed: (){
                        if(_formkey.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Validando')));

                            var usuario = Usuario(
                              id: '', 
                              usuarioId: 0, 
                              nombre: txtUser.text, 
                              email: txtEmail.text, 
                              password: txtPassword.text, 
                              estado: true, 
                              rol: '',
                              img: "");

                              usuarioProvider.saveUsuario(usuario);


                          Navigator.pushReplacementNamed(context, 'usuarios_screen');
                        }
                      },
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
                ),
              )  
            ],
            ),
          ),
        )
      ],
    );;
  }
}