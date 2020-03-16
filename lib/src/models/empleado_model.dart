// To parse this JSON data, do
//
//     final empleadoModel = empleadoModelFromJson(jsonString);

import 'dart:convert';

EmpleadoModel empleadoModelFromJson(String str) => EmpleadoModel.fromJson(json.decode(str));

String empleadoModelToJson(EmpleadoModel data) => json.encode(data.toJson());

class EmpleadoModel {
    String noEmpleado;
    String nombre;
    String email;
    String telefono;

    EmpleadoModel({
        this.noEmpleado,
        this.nombre,
        this.email,
        this.telefono,
    });

    factory EmpleadoModel.fromJson(Map<String, dynamic> json) => EmpleadoModel(
        noEmpleado: json["noEmpleado"],
        nombre: json["nombre"],
        email: json["email"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "noEmpleado": noEmpleado,
        "nombre": nombre,
        "email": email,
        "telefono": telefono,
    };
}