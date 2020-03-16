import 'package:flutter/material.dart';
import 'package:pruebalogin2/src/pages/data_tables.dart';
import 'package:pruebalogin2/src/pages/home_page.dart';
import 'package:pruebalogin2/src/pages/login_page.dart';
import 'package:pruebalogin2/src/pages/registrar_empleado.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Empleados',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => HomePage(),
        'registrarEmpleado' : (BuildContext context) => RegistrarEmpleadoPage(),
        'TablasAlumnos' : (BuildContext context) => DataTablesPage(),
        'LoginPage' : (BuildContext context) => LoginPage(),

      },
    );
  }
}