import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pruebalogin2/src/models/empleado_model.dart';




class EmpleadosProvider {

  final String _url = 'http://192.168.1.74/empleados';


  Future<bool> registrarEmpleado( EmpleadoModel empleado ) async {
    
    final url = '$_url/empleados.php';

    final map = Map<String, dynamic>();
    map['action'] = 'ADD_EMP';
    map['noEmpleado'] = empleado.noEmpleado;
    map['nombre'] = empleado.nombre;
    map['email'] = empleado.email;
    map['telefono'] = empleado.telefono;


    final resp = await http.post( url, body: map);//empleadoToJson(empleado) );

    print(empleadoToJson(empleado) );
    print(empleado.noEmpleado);
    print(resp.statusCode);
    print(resp.body);

    if (resp.statusCode == 200) {
      if (resp.body == 'success')
        return true;
      else
        return false;
    } else {
       return false;
    }

   
  }

  Future<bool> editarEmpleado( EmpleadoModel empleado ) async {
    
    final url = '$_url/empleados.php';

    final map = Map<String, dynamic>();
    map['action'] = 'UPDATE_EMP';
    map['noEmpleado'] = empleado.noEmpleado;
    map['nombre'] = empleado.nombre;
    map['email'] = empleado.email;
    map['telefono'] = empleado.telefono;


    final resp = await http.post( url, body: map);//empleadoToJson(empleado) );


    if (resp.statusCode == 200) {
      if (resp.body == 'success')
        return true;
      else
        return false;
    } else {
       return false;
    }

  }



  Future<List<EmpleadoModel>> obtenerEmpleados() async {

    final url  = '$_url/empleados.php';
    final List<EmpleadoModel> empleados = new List();


    final map = Map<String, dynamic>();
    map['action'] = 'GET_ALL';

    final resp = await http.post( url, body: map);

    
    if (resp.statusCode == 200) {

      final decodedData = json.decode(resp.body).cast<Map<String, dynamic>>();      

      if ( decodedData == null ) return [];

      /*
      decodedData.forEach((noEmpleado, empleado){
        final empleadoTemp = EmpleadoModel.fromJson(empleado);
        empleados.add( empleadoTemp );
      });

*/

      return decodedData.map<EmpleadoModel>( (json) => EmpleadoModel.fromJson(json) ).toList();


       //return empleados;
    } else {
       return [];
    }



/*
    
    decodedData.forEach( ( noEmpleado, empleado ){

      final empleadoTemp = EmpleadoModel.fromJson(empleado);
      empleadoTemp.noEmpleado = noEmpleado;

      empleados.add( empleadoTemp );

    });

  */
    
  }


  Future<int> borrarEmpleado( String id ) async { 

    final url  = '$_url/empleados.php';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }

  Object empleadoToJson(EmpleadoModel empleado) {}




}

