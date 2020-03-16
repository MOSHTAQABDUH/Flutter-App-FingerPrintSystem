import 'package:http/http.dart' as http;
import 'package:pruebalogin2/src/models/empleado_model.dart';

class EmpleadosProvider{

final String _url = 'http://192.168.1.74/empleados';

//Metodo para registrar un empleado

Future<bool> registrarEmpleado(EmpleadoModel empleado) async {
final url = '$_url/empleados.php';

final map = Map<String, dynamic>();

map['action'] = 'ADD_EMP';
map['noEmpleado'] = empleado.noEmpleado;
map['nombre'] = empleado.nombre;
map['email'] = empleado.email;
map['telefono'] = empleado.telefono;

final resp = await http.post(url, body:map);

//verifiar si accedio a la pagina

if (resp.statusCode == 200) {
  if(resp.body == 'success')
  return true;
  else
  return false;
  
} else {
  return false;
}

}

}