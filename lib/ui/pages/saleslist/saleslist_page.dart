import 'dart:io';

import 'package:appsauri/model/doc_electronico.dart';
import 'package:appsauri/ui/components/alert.dart';
import 'package:appsauri/ui/constants.dart';
import 'package:appsauri/ui/pages/configuration/widget/simple_dialog_widget.dart';
import 'package:appsauri/ui/pages/saleslist/widget/item_card_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import '../../../provider/app_provider.dart';
import '../../components/activity_indicator.dart';

class SalesListPage extends StatefulWidget {
  static String id = "saleslist_page";

  const SalesListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SalesListPageState();
  }
}

class _SalesListPageState extends State<SalesListPage> {
  TextEditingController busquedaController = TextEditingController();
  FocusNode busquedaFocus = FocusNode();

  AppProvider? appProvider;
  CancelToken cancelToken = CancelToken();
  bool loading = false;
  bool responseOk = false;
  String message = "";
  List<DocElectronico> docElectronico = [];

  int opcion = 0;
  int paginacion = 0;
  int filasPorPagina = 5;
  int totalPaginacion = 0;

  _SalesListPageState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _onLoadInit();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00a46a),
        title: const Text(
          "Ventas realizadas",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: _onLoadInit,
              child: const Icon(
                Icons.restart_alt,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _viewWidget(size),
              _searchWidget(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActivityIndicator(
            color: colorPrimary,
            radius: 20,
            size: 40,
            marginBottom: 20,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _reloadWidget(Size size, {String textButton = "Reintentar"}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/tiquepos_logo.png",
            height: 120,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            width: size.width,
            height: 55,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                onPressed: () {
                  _onLoadInit();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xff00a46a),
                  // primary: const Color(0xff00a46a),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                ),
                child: Text(
                  textButton,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _viewWidget(Size size) {
    if (loading) {
      return _loadWidget();
    }

    if (!responseOk) {
      return _reloadWidget(size);
    }

    if (docElectronico.isEmpty) {
      return _reloadWidget(size, textButton: "Recargar");
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 150,
        ),
        child: Column(
          children: docElectronico.map((DocElectronico de) {
            return ItemCardWidget(
              comprobante:
                  "${de.id}. ${de.sunatTipoDocElectronico.descripcion}",
              fecha: de.fecha_registro,
              hora: de.hora_registro,
              serie: de.serie_comprobante,
              numeracion: de.numero_comprobante,
              numDocumento: de.cliente.num_doc,
              informacion: de.cliente.razon_social,
              simbolo: de.sunatMoneda.simbolo,
              total: de.total,
              marginBottom: 20,
              onPressedPdf: () {
                _openFile(
                  de.pdf,
                  "${de.cliente.razon_social} - A4: ${de.serie_comprobante}-${de.numero_comprobante}.pdf",
                );
              },
              onPressedTicket: () {
                _openFile(
                  de.ticket,
                  "${de.cliente.razon_social} - TICKET: ${de.serie_comprobante}-${de.numero_comprobante}.pdf",
                );
              },
              onPressedShare: () {
                _shareFile([
                  {
                    "url": de.pdf,
                    "fileName":
                        "${de.cliente.razon_social} - A4: ${de.serie_comprobante}-${de.numero_comprobante}.pdf"
                  },
                  {
                    "url": de.ticket,
                    "fileName":
                        "${de.cliente.razon_social} - TICKET: ${de.serie_comprobante}-${de.numero_comprobante}.pdf",
                  },
                ]);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _searchWidget(Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      width: size.width,
      height: 160,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: const Color(0xffe0e0e0),
                      ),
                    ),
                    child: TextFormField(
                      controller: busquedaController,
                      onChanged: (String value) {
                        if (value.isEmpty) return;

                        if (loading) return;

                        setState(() {
                          paginacion = 1;
                        });

                        _onLoadVentas(1, value);

                        setState(() {
                          opcion = 1;
                        });
                      },
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: Color(0xff868d96),
                        ),
                        hintText: "Escribe para filtrar",
                        hintStyle: TextStyle(
                          color: Color(0xff868d96),
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mostrando $paginacion página de $totalPaginacion"),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _onEventPaginationLeft,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xff00a46a),
                          // primary: const Color(0xff00a46a),
                          foregroundColor: const Color(0xffffffff),
                          // onPrimary: const Color(0xffffffff),
                          disabledBackgroundColor: Colors.transparent,
                          // onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          minimumSize: const Size(0, 0),
                          padding: const EdgeInsets.all(2.0),
                        ),
                        child: const Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: _onEventPaginationRight,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xff00a46a),
                          // primary: const Color(0xff00a46a),
                          foregroundColor: const Color(0xffffffff),
                          // onPrimary: const Color(0xffffffff),
                          disabledBackgroundColor: Colors.transparent,
                          // onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          minimumSize: const Size(0, 0),
                          padding: const EdgeInsets.all(2.0),
                        ),
                        child: const Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
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

  void _onEventPaginationLeft() {
    if (loading) return;

    if (paginacion > 1) {
      setState(() {
        paginacion = paginacion - 1;
      });

      _onEventPagination();
    }
  }

  void _onEventPaginationRight() {
    if (loading) return;

    if (paginacion < totalPaginacion) {
      setState(() {
        paginacion = paginacion + 1;
      });

      _onEventPagination();
    }
  }

  void _onEventPagination() {
    switch (opcion) {
      case 0:
        _onLoadVentas(0, "");
        break;
      default:
        _onLoadVentas(1, busquedaController.text);
        break;
    }
  }

  void _onLoadInit() {
    if (loading) return;

    setState(() {
      paginacion = 1;
    });

    _onLoadVentas(0, "");

    setState(() {
      opcion = 0;
    });
  }

  void _onLoadVentas(int opcion, buscar) async {
    setState(() {
      message = "Cargando ventas, espere por favor...";
      loading = true;
      responseOk = true;
    });

    Map<String, dynamic> payload = {
      "opcion": opcion,
      "busqueda": buscar,
      "paginacion": (paginacion - 1) * filasPorPagina,
      "filasPorPagina": filasPorPagina
    };

    dynamic response =
        await appProvider!.lista(payload, cancelToken: cancelToken);

    if (response is Response) {
      var data = response.data;

      List<DocElectronico> lista = [];

      for (var item in data["ventas"]) {
        lista.add(DocElectronico.fromJson(item));
      }

      double tpdouble = data["total"] is int
          ? data["total"] / filasPorPagina
          : int.parse(data["total"]) / filasPorPagina;

      int tpinte = tpdouble.toInt().ceil();

      setState(() {
        message =
            lista.isEmpty ? "No se encontro datos de la busqueda. :(" : "";
        loading = false;
        responseOk = true;
        docElectronico = lista;
        totalPaginacion = tpinte;
      });

      return;
    }

    if (response is Map) {
      if (response["type"] == DioErrorType.cancel) return;

      setState(() {
        message = response["message"];
        loading = false;
        responseOk = false;
        paginacion = 0;
      });

      return;
    }

    if (response is String) {
      setState(() {
        message = response;
        loading = false;
        responseOk = false;
        paginacion = 0;
      });
    }
  }

  Future _openFile(String url, String fileName) async {
    SimpleDialogWidget.showCustomDialog(
      context,
      message: 'Descargando PDF...',
    );

    final file = await _downloadFile(url, fileName);
    if (file == null) {
      _alertError("No se puede descargar el documento por error de red o url.");
      return;
    }

    final result = await OpenFilex.open(file.path);
    if (result.type != ResultType.done) {
      _alertError(
          "Error en abrir el documento por no encontrar una aplicación que genere.");
      return;
    }

    _closePop();
  }

  Future _shareFile(List<Map<String, dynamic>> data) async {
    SimpleDialogWidget.showCustomDialog(
      context,
      message: 'Descargando PDF...',
    );

    List<XFile> list = [];

    for (Map<String, dynamic> item in data) {
      final file = await _downloadFile(item["url"], item["fileName"]);
      if (file != null) {
        list.add(XFile(file.path));
      }
    }

    _closePop();

    _openShare(list);
  }

  Future<File?> _downloadFile(String url, String name) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File('${appStorage.path}/$name');

      bool isFile = await File(file.path).exists();
      if (isFile) {
        await File(file.path).delete();
      }

      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }

  void _closePop() {
    Navigator.pop(context);
  }

  void _alertError(String message) {
    Navigator.pop(context);
    Alert(context: context).showAlert(message);
  }

  void _openShare(List<XFile> paths) async {
    await Share.shareXFiles(paths, text: "Archivo pdf");
  }
}
