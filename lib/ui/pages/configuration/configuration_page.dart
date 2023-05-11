import 'package:appsauri/ui/constants.dart';
import 'package:appsauri/ui/pages/configuration/printers/printers_page.dart';
import 'package:appsauri/ui/pages/login/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/usuario.dart';
import '../../../provider/app_provider.dart';
import '../../components/alert.dart';
import 'widget/box_option_widget.dart';
import 'widget/simple_dialog_widget.dart';

class CongiturationPage extends StatefulWidget {
  static String id = "configuration_page";

  const CongiturationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CongiturationPageState();
}

class _CongiturationPageState extends State<CongiturationPage> {
  AppProvider? appProvider;

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: const Text(
          "Configuración",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  BoxOptionWidget(
                    onTap: () {},
                    image: true,
                    path: "assets/empresa.svg",
                    pathSize: 32,
                    title: "Empresa",
                    subTitle: "Información y configuración de la empresa",
                  ),
                  BoxOptionWidget(
                    onTap: () async {
                      PermissionStatus bluetoothScan =
                          await Permission.bluetoothScan.request();

                      Permission.location.request();

                      // PermissionStatus bluetooth =
                      //     await Permission.bluetooth.request();

                      // PermissionStatus bluetoothConnect =
                      //     await Permission.bluetoothConnect.request();

                      print(bluetoothScan.isGranted);
                      // print(bluetooth.isGranted);

                      return;

                      if (bluetoothScan.isGranted) {
                        Navigator.pushNamed(
                          context,
                          PrintersPage.id,
                        );
                        return;
                      }

                      openAppSettings();

                      // var status = await Permission.bluetoothConnect.request();

                      // if (status.isGranted) {
                      //   print(status);
                      //   Navigator.pushNamed(
                      //     context,
                      //     PrintersPage.id,
                      //   );
                      // } else {
                      //   print(status);
                      //   openAppSettings();
                      // }
                    },
                    image: true,
                    path: "assets/impresora.svg",
                    pathSize: 32,
                    title: "Impresoras",
                    subTitle: "Impresoras vinculadas",
                  ),
                  BoxOptionWidget(
                    onTap: () {},
                    image: true,
                    path: "assets/recibo.svg",
                    pathSize: 32,
                    title: "Impresión",
                    subTitle: "Datos y formato de impresión",
                  ),
                  BoxOptionWidget(
                    onTap: () {},
                    image: true,
                    path: "assets/sunat.svg",
                    pathSize: 32,
                    title: "SUNAT",
                    subTitle: "Configuración SUNAT",
                  ),
                  BoxOptionWidget(
                    onTap: () async {
                      Alert(context: context).showConfirm(
                          "¿Está seguro de cerrar sesión?.", aceptar: () {
                        _onEventClose();
                      });
                    },
                    image: false,
                    icon: Icons.power_settings_new,
                    iconSize: 29,
                    title: "Cerrar Sesión",
                    subTitle: "Cerrar la aplicación",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onEventClose() async {
    SimpleDialogWidget.showCustomDialog(
      context,
      message: 'Cerrando sesión...',
    );
    dynamic response = await appProvider!.logout();

    if (response is Response) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();

      _navigateLogin(appProvider!);
      return;
    }

    if (response is Map) {
      if (response["type"] == DioErrorType.cancel) return;

      _alertError(response["message"]);
      return;
    }

    if (response is String) {
      _alertError(response);
    }
  }

  void _navigateLogin(AppProvider appProvider) async {
    appProvider.isLoading = false;
    appProvider.isSignout = true;
    appProvider.usuario = Usuario();

    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginPage.id,
      (Route<dynamic> route) => false,
    );
  }

  void _alertError(String message) {
    Navigator.pop(context);
    Alert(context: context).showAlert(message);
  }
}
