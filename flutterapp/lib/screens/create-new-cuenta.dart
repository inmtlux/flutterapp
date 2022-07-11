import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primera_prueba/models/usuario.dart';
import 'package:primera_prueba/palette.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
//import 'package:primera_prueba/screens/terr-cat-screen.dart';
import 'package:primera_prueba/widgets/background-image.dart';
import 'package:provider/provider.dart';

class CreateNewAccounte extends StatefulWidget {
  CreateNewAccounte({Key? key}) : super(key: key);

  @override
  State<CreateNewAccounte> createState() => _CreateNewAccounteState();
}

enum Categorias { Gold, Platinum, Diamond }

class _CreateNewAccounteState extends State<CreateNewAccounte> {
  File? imagen;
  final picker = ImagePicker();
  final _formkey = GlobalKey<FormState>();

  final txtUser = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtPassConf = TextEditingController();

  Categorias? _catselection = Categorias.Gold;
  bool? _estadoActivo = false;
  Future selImage(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
      print(pickedFile);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
        print('========================');
        print(imagen!.path);
        print('========================');
      } else {
        print('No seleccionaste ninguna imagen');
      }
    });

    Navigator.of(context).pop();
  }

  Dio dio = new Dio();
  Future<void> subir_imagen(String id) async {
    try {
      String filename = imagen!.path.split('/').last;
      print('========================');
      print(filename);
      print('========================');

      FormData formData = new FormData.fromMap({
        'archivo':
            await MultipartFile.fromFile(imagen!.path, filename: filename)
      });

      await dio
          .putUri(
              Uri.http(
                  'api-sliderin.herokuapp.com', '/api/upload/usuarios/' + id),
              data: formData)
          .then((value) {
        print(value);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              
              child: Column(
                
                children: [
                  InkWell(
                    onTap: () {
                      selImage(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: Color.fromARGB(255, 73, 73, 73)))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: kBlue,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImage(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Seleccionar una foto ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.image,
                            color: kBlue,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/libros.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 56,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.grey[500]?.withOpacity(0.5),
                            child: Icon(FontAwesomeIcons.user,
                                color: kWhite, size: 45),
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
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        //cuadro gris
                        height: 56,
                        width: 450,
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

                            style: kBodyText, //stilo de la letra
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        //cuadro gris
                        height: 56,
                        width: 450,
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

                            style: kBodyText, //stilo de la letra
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        //cuadro gris
                        height: 56,
                        width: 450,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Icon(
                                  //ponemos un icono antes del texto
                                  Icons.block,
                                  size: 30, //tamaño del icono
                                  color: kWhite,
                                ),
                              ),

                              hintText: ('Contraseña'), //para escribir el email
                              hintStyle: kBodyText,
                            ),

                            controller: txtPassword,
                            /*validator: (value){
                            if(value!.isEmpty){
                              return 'Porfavor ingrese una contraseña';
                            }
                          },*/

                            obscureText:
                                true, //para que las letras tengan cifrado ***
                            style:
                                kBodyText, //stilo de la laetra que ira dentro del recuadro
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        //cuadro gris
                        height: 56,
                        width: 450,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Icon(
                                  //ponemos un icono antes del texto
                                  Icons.block,
                                  size: 30, //tamaño del icono
                                  color: kWhite,
                                ),
                              ),

                              hintText: ('Contraseña'), //para escribir el email
                              hintStyle: kBodyText,
                            ),

                            controller: txtPassConf,
                            validator: (value) {
                              if (txtPassConf == '${txtPassword}') {
                                return 'Porfavor confirmar contraseña';
                              }
                            },
                            obscureText:
                                true, //para que las letras tengan cifrado ***
                            style:
                                kBodyText, //stilo de la laetra que ira dentro del recuadro
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      InkWell(
                    onTap: () {
                      opciones(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right:20),

                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: kBlue,
                        borderRadius: BorderRadius.circular(20)
                        ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(width: 25,),
                          Expanded(
                            
                            child: Text(
                              'Seleccionar una foto ',
                              // textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18,color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Categoria',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Radio(
                              value: Categorias.Gold,
                              groupValue: _catselection,
                              onChanged: (value) {
                                setState(() {
                                  _catselection = value as Categorias?;
                                  print(_catselection);
                                });
                              }),
                          Text(
                            'Golden',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Radio(
                              value: Categorias.Platinum,
                              groupValue: _catselection,
                              onChanged: (value) {
                                setState(() {
                                  _catselection = value as Categorias?;
                                  print(_catselection);
                                });
                              }),
                          Text(
                            'Platinum',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Radio(
                              value: Categorias.Diamond,
                              groupValue: _catselection,
                              onChanged: (value) {
                                setState(() {
                                  _catselection = value as Categorias?;
                                  print(_catselection);
                                });
                              }),
                          Text(
                            'Diamond',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Text('Estado'),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Checkbox(
                    //         value: _estadoActivo,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _estadoActivo = value;
                    //             print('_estadoActivo: ${_estadoActivo}');
                    //           });
                    //         }),
                    //     Text('Activo')
                    //   ],
                    // ),
                    Container(
                      height: 56,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kBlue,
                      ),
                      child: FlatButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Validando')));

                            var usuario = Usuario(
                                id: '',
                                usuarioId: 0,
                                nombre: txtUser.text,
                                email: txtEmail.text,
                                password: txtPassword.text,
                                estado: 'true',
                                rol: '',
                                img: "",
                                categoria: _catselection.toString());

                            final rsp = await usuarioProvider.saveUsuario(usuario);

                            print('===========  Usuario nuevo   =========');
                            print('Bienvenido ' + rsp['usuario']['nombre']);
                            String usuarioId = await (rsp['usuario']['usuarioId']).toString();
                            print(usuarioId);
                            print('===========================');
                            await subir_imagen(usuarioId);
                            usuarioProvider.getOnUsuarioList();
                            Navigator.pushReplacementNamed(
                                context, 'usuarios_screen');
                          }
                        },
                        child: Text(
                          'Create',
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ya tienes una cuenta?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Ingresar',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ]),
                )
              ],
            ),
          ),
        )
      ],
    );
    ;
  }
}
