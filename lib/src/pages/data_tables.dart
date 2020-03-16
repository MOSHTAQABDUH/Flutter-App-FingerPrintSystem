import 'package:flutter/material.dart';
import 'package:pruebalogin2/src/widgets/menu_widget.dart';

class DataTablesPage extends StatefulWidget {

  @override
  __DataTablesPageState createState() => __DataTablesPageState();
}

class __DataTablesPageState extends State<DataTablesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Tabla de asistencias'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text('Tabla de asistencias de alumnos de TI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),
          ),
          DataTable(
            columns: [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Asistencias')),
                DataColumn(label: Text('Faltas')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Alberto Hermosillo')),
                  DataCell(Text('10'),placeholder: true,showEditIcon: true),
                  DataCell(Text('0'),placeholder: true,showEditIcon: true),
                ]),
                DataRow(cells: [
                  DataCell(Text('Alexandra Jimenez')),
                  DataCell(Text('12'),placeholder: true,showEditIcon: true),
                  DataCell(Text('1'),placeholder: true,showEditIcon: true),
                ]),
                DataRow(cells: [
                  DataCell(Text('Yao Hu')),
                  DataCell(Text('0'),placeholder: true,showEditIcon: true),
                  DataCell(Text('15'),placeholder: true,showEditIcon: true,onTap: (){}),
                ]),
              ],
          ),
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
                    onPressed: (){},
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
      drawer: MenuWidget(),
    );
  }
}