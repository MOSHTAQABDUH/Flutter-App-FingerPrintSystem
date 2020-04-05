import 'package:flutter/material.dart';
import 'package:pruebalogin2/src/models/empleado_model.dart';
import 'package:pruebalogin2/src/providers/empleados_provider.dart';
import 'package:pruebalogin2/src/widgets/menu_widget.dart';

class EditarEmpleadoPage extends StatefulWidget {
 
  @override
  _EditarEmpleadoPageState createState() => _EditarEmpleadoPageState();
}

class _EditarEmpleadoPageState extends State<EditarEmpleadoPage> {
  
  TextEditingController controllerNoEmpleado = new TextEditingController();
  TextEditingController controllerEmpleado = new TextEditingController();
  TextEditingController controllerCorreo = new TextEditingController();
  TextEditingController controllerTelefono = new TextEditingController();


  final empleadoProvider = new EmpleadosProvider();
  EmpleadoModel empleado = new EmpleadoModel();

//Método que se llama cada vez que se crea la clase 
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Obtener el objeto empleado, enviado como argumento desde la DataTable
    empleado = ModalRoute.of(context).settings.arguments;

  }

//Método que se llama después del initState al crearse la clase y sus widgets
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();    
    //Llamado al método para cargar los datos del empleado al formulario
    _cargaDatosEmpleado();
  }
 


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar empleado"),
      ),
      drawer: MenuWidget(),
      body: Form(        
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.format_list_numbered, color: Colors.black),
                    title: new TextFormField(
                    controller: controllerNoEmpleado,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "No. empleado", labelText: "No. empleado",
                      ),
                      
                    ),
                    
                    
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerEmpleado,                          
                      decoration: new InputDecoration(
                        hintText: "Nombre empleado", labelText: "Nombre",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.email, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCorreo,
                      keyboardType: TextInputType.emailAddress,                          
                      decoration: new InputDecoration(
                        hintText: "Email", labelText: "Email",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.phone, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerTelefono,
                      keyboardType: TextInputType.phone,                          
                      decoration: new InputDecoration(
                        hintText: "Teléfono", labelText: "Teléfono",
                      ),
                    ),
                  ),
                  new Padding(
                   padding: const EdgeInsets.all(30.0),
                 ),         
                 new Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                      new RaisedButton(
                        child: new Text("Actualizar", style: TextStyle(color: Colors.white)),                        
                        color: Colors.blueAccent,                        
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          _actualizarEmpleado();
                        },                                                
                      ),
                      new SizedBox(width: 10.0),
                      new RaisedButton(
                        child: new Text("Regresar", style: TextStyle(color: Colors.white)),
                        color: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'listaEmpleados');
                        },
                      )
                   ],
                 )
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }

  void _cargaDatosEmpleado() {
    //Vaciar el contenido del objeto empleado al formulario de edición
    controllerNoEmpleado.text = empleado.noEmpleado;
    controllerEmpleado.text = empleado.nombre;
    controllerCorreo.text = empleado.email;
    controllerTelefono.text = empleado.telefono;    
  }

  void _actualizarEmpleado() {
    //Vaciar el contenido de los inputText a la clase empleadoModel
    empleado.noEmpleado = controllerNoEmpleado.text;
    empleado.nombre = controllerEmpleado.text;
    empleado.email = controllerCorreo.text;
    empleado.telefono = controllerTelefono.text;

    //Llamado al método para editarEmpleado
    final resp = empleadoProvider.editarEmpleado(empleado);

    print(resp);

  }
  
}