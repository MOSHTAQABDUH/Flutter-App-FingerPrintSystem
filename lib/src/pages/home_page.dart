import 'package:flutter/material.dart';
import 'package:pruebalogin2/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('...::Bienvenido Maestro::...'),
        backgroundColor: Colors.green,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Bienvenido a la app de gestion de alumnos',
          style: TextStyle(fontSize: 20.0, color:Colors.green),
          textAlign: TextAlign.center,
      ),
    ),
    );
  }
}