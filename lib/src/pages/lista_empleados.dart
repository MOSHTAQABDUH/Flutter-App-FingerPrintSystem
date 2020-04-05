import 'package:flutter/material.dart';

import 'package:pruebalogin2/src/providers/empleados_provider.dart';
import 'package:pruebalogin2/src/models/empleado_model.dart';
import 'package:pruebalogin2/src/widgets/menu_widget.dart';

class ListaEmpleadosPage extends StatefulWidget {
  
  @override
  _ListaEmpleadosPageState createState() => _ListaEmpleadosPageState();
}

class _ListaEmpleadosPageState extends State<ListaEmpleadosPage> {
  final _empleadoProvider = new EmpleadosProvider();
  List<EmpleadoModel> _empleados; 

  @override
  void initState() {
    super.initState();
    _empleados = [];
    _getEmpleados();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('..:: Lista de empleados ::..'),
      ),
      drawer: MenuWidget(),
      body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Expanded(
                      child: _dataBody(),
                    ),
                ]
              ),
            ),
    );
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('NO. EMP.'),
            ),
            DataColumn(
              label: Text('NOMBRE'),
            ),
            DataColumn(
              label: Text('EMAIL'),
            ),
            DataColumn(
              label: Text('TEL.'),
            ),
            // Lets add one more column to show a delete button
            DataColumn(
              label: Text('EDITAR'),
            ),
            DataColumn(
              label: Text('ELIMINAR'),
            )
          ],
          rows: _empleados
              .map(
                (empleado) => DataRow(cells: [
                  DataCell(
                    Text(empleado.noEmpleado),
                    // Add tap in the row and populate the
                    // textfields with the corresponding values to update
                    onTap: () {
                      setState(() {
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      empleado.nombre.toUpperCase(),
                    ),
                    onTap: () {
                       setState(() {
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      empleado.email,
                    ),
                    onTap: () {
                      setState(() {
                    
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      empleado.telefono,
                    ),
                    onTap: () {
                      setState(() {
                   
                      });
                    },
                  ),
                  DataCell(IconButton(
                    icon: Icon(Icons.update),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'editarEmpleado', arguments: empleado );
                    },
                  )),
                  DataCell(IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {

                    },
                  ))
                ]),
              )
              .toList(),
        )
      )
    );
  }

  _getEmpleados() {
    
    _empleadoProvider.obtenerEmpleados().then((empleados) {
      setState(() {
        _empleados = empleados;
      });
      
    });
  }

}