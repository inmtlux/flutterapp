import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SLIDERIN',
            style: TextStyle(color: Colors.black, fontSize: 30.0,fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        
      ),
      body: Container(child: Text('Home')),
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'School',
          ),
          
      ],
      )
    );
  }
}
