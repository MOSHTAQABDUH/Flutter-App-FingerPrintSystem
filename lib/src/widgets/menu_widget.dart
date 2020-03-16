import 'dart:io';

import 'package:flutter/material.dart';


class MenuWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/empleo.jpg'),
                  fit: BoxFit.contain
                ),
              ),
            )
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.greenAccent),
              title: Text('Inicio'),
              onTap: ()=>Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.greenAccent),
              title: Text('Registrar alumno'),
              onTap: ()=>Navigator.pushReplacementNamed(context, 'registrarEmpleado'),
            ),
            ListTile(
              leading: Icon(Icons.person_outline, color: Colors.greenAccent),
              title: Text('Consultar alumnos'),
              onTap: ()=>Navigator.pushReplacementNamed(context, 'TablasAlumnos'),
            ),
            ListTile(
              leading: Icon(Icons.library_add, color: Colors.greenAccent),
              title: Text('Lista de alumnos'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.green),
              title: Text('Salir'),
              onTap: ()=>Navigator.pushReplacementNamed(context, 'LoginPage'),
            ),
        ],
      ),
    );
  }
}