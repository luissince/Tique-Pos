import '../../../constants.dart';
import './button_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemCardWidget extends StatelessWidget {
  final String comprobante;
  final String fecha;
  final String hora;
  final String serie;
  final int numeracion;
  final String numDocumento;
  final String informacion;
  final String simbolo;
  final double total;
  final double marginBottom;
  final Function() onPressedPdf;
  final Function() onPressedTicket;
  final Function() onPressedShare;

  const ItemCardWidget({
    Key? key,
    this.comprobante = "",
    this.fecha = "",
    this.hora = "",
    this.serie = "",
    this.numeracion = 0,
    this.numDocumento = "",
    this.informacion = "",
    this.simbolo = "",
    this.total = 0,
    this.marginBottom = 20,
    required this.onPressedPdf,
    required this.onPressedTicket,
    required this.onPressedShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse("$fecha $hora");

    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.transparent,
        border: Border.all(
          color: const Color(0xffe0e0e0),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comprobante,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Fecha:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff868d96),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "$fecha / ${DateFormat('hh:mm a').format(parsedDate)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0xff868d96),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Text(
                      "Comprobante:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff868d96),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "$serie-$numeracion",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0xff868d96),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Text(
                      "N° Documento:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff868d96),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        numDocumento,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0xff868d96),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Text(
                      "Información:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff868d96),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        informacion,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0xff868d96),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff868d96),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "$simbolo ${formatMoney(total)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Color(0xff000000),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              ButtonCardWidget(
                path: "assets/pdf_cpe.svg",
                onPressed: onPressedPdf,
              ),
              ButtonCardWidget(
                path: "assets/ticket_cpe.svg",
                onPressed: onPressedTicket,
              ),
              ButtonCardWidget(
                path: "assets/share.svg",
                onPressed: onPressedShare,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
