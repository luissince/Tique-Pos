import 'package:appsauri/model/cliente.dart';
import 'package:appsauri/model/condiciondepago.dart';
import 'package:appsauri/model/sunat_moneda.dart';
import 'package:appsauri/model/sunat_tipodocelectronico.dart';

class DocElectronico {
  int id;
  int? id_contribuyente;
  String? id_tipodoc_electronico;
  String serie_comprobante;
  int numero_comprobante;
  String? tipo_envio_sunat;
  String? id_tipo_operacion;
  String fecha_registro;
  String hora_registro;
  String pdf;
  String ticket;
  double total;
  SunatTipoDocElectronico sunatTipoDocElectronico;
  Cliente cliente;
  SunatMoneda sunatMoneda;
  CondicionPago condicionPago;

  DocElectronico(
    this.id,
    this.fecha_registro,
    this.hora_registro,
    this.serie_comprobante,
    this.numero_comprobante,
    this.pdf,
    this.ticket,
    this.total,
    this.sunatTipoDocElectronico,
    this.cliente,
    this.sunatMoneda,
    this.condicionPago,
  );

  factory DocElectronico.fromJson(Map<String, dynamic> json) {
    SunatTipoDocElectronico sunatTipoDocElectronico =
        SunatTipoDocElectronico.descripcion(
      json["descripcion"],
    );

    Cliente cliente = Cliente.venta(
      json["num_doc"],
      json["razon_social"],
    );

    SunatMoneda sunatMoneda = SunatMoneda.venta(json["simbolo"]);

    CondicionPago condicionPago = CondicionPago.venta(json["condicionpago"]);

    return DocElectronico(
      json["id"],
      json["fecha_registro"],
      json["hora_registro"],
      json["serie_comprobante"],
      json["numero_comprobante"],
      json["pdf"],
      json["ticket"],
      double.parse(json["total"]),
      sunatTipoDocElectronico,
      cliente,
      sunatMoneda,
      condicionPago,
    );
  }
}
