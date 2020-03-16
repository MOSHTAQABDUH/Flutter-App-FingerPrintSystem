import 'package:flutter/material.dart';
import 'package:pruebalogin2/src/models/empleado_model.dart';
import 'package:pruebalogin2/src/providers/empleados_provider.dart';
import 'package:pruebalogin2/src/widgets/menu_widget.dart';

class RegistrarEmpleadoPage extends StatefulWidget {

  @override
  _RegistrarEmpleadoPageState createState() => _RegistrarEmpleadoPageState();
}

class _RegistrarEmpleadoPageState extends State<RegistrarEmpleadoPage> {

//Atributos para asociar cada campo  del formulario

TextEditingController controllerNoEmpleado = new TextEditingController();
TextEditingController controllerNombre = new TextEditingController();
TextEditingController controllerEmail = new TextEditingController();
TextEditingController controllerTelefono = new TextEditingController();

//Instanciar el EmpleadoProvider

final empleadoProvider = new EmpleadosProvider();
//Instanciar el EmpleadoModel
EmpleadoModel empleado = new EmpleadoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Registrar alumno'),
      ),
      drawer: MenuWidget(),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.assignment_ind, color:Colors.green),
                title: TextFormField(
                  controller: controllerNoEmpleado,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'NoEmpleado',
                    labelText: 'NoEmpleado',
                  ),
                ),
              ),
              //Campo empleado
              ListTile(
                leading: Icon(Icons.directions_subway, color:Colors.green),
                title: TextFormField(
                  controller: controllerNombre,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    labelText: 'Nombre',
                  ),
                ),
              ),
              //correo electronico
              ListTile(
                leading: Icon(Icons.email, color:Colors.green),
                title: TextFormField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    hintText: 'Correo',
                    labelText: 'Correo',
                  ),
                ),
              ),
              //telefono
              ListTile(
                leading: Icon(Icons.phone, color:Colors.green),
                title: TextFormField(
                  controller: controllerTelefono,
                  decoration: InputDecoration(
                    hintText: 'Telefono',
                    labelText: 'Telefono',
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              //Botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Guardar', style: TextStyle(color: Colors.white)),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    onPressed: (){
                      _registrarEmpleado();
                    },
                    ),
                    SizedBox(width: 10.0,),
                    RaisedButton(
                    child: Text('Cancelar', style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    ),
                ],
              ), 
            ],
          ),
        ),
      ),
    );
  }

  void _registrarEmpleado(){
    //Vaciar el contenido de los campos a los atributos de la clase empleado
    empleado.noEmpleado = controllerNoEmpleado.text;
    empleado.nombre = controllerNombre.text;
    empleado.email = controllerEmail.text;
    empleado.telefono = controllerTelefono.text;

    //Llamar al metodo registrar empleado del empleado provider
    final resp = empleadoProvider.registrarEmpleado(empleado);
    print(resp);
  }
}