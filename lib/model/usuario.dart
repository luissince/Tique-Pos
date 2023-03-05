import 'contribuyente.dart';
import 'rol_usuario.dart';

class Usuario {
  int? idusuario;
  int? id_contribuyente;
  String? codigo;
  int? id_rol;
  String? nombre;
  String? apellido;
  String? celular;
  String? telefono;
  String? email;
  String? password;
  String? url_image;
  DateTime? fecha_registro;
  String? estado;
  int? idsucursal;
  String? ver_ventas_totales;
  String? modificacion_almacen;
  String? modificacion_multi_almacen;
  String? ventas_multisucursal;
  String? acceso_mod_compras;
  String? validar_precio_minimo;
  String? permisos;
  String? token;
  Contribuyente? contribuyente;
  RolUsuario? rol_usuario;

  Usuario();
}
