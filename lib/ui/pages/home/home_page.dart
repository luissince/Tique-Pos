import 'package:appsauri/ui/constants.dart';
import 'package:appsauri/ui/pages/saleslist/saleslist_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../model/contribuyente.dart';
import '../../../model/rol_usuario.dart';
import '../../../provider/app_provider.dart';
import '../../components/activity_indicator.dart';
import '../configuration/configuration_page.dart';
import '../newsale/newsale_page.dart';
import 'widget/box_option_widget.dart';
import 'widget/company_widget.dart';
import 'widget/title_widget.dart';

class HomePage extends StatefulWidget {
  static String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppProvider? appProvider;
  bool loading = true;
  bool responseOk = false;
  String message = "";

  _HomePageState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _loadHomeData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SafeArea(
            child: loading
                ? _loadWidget()
                : !responseOk
                    ? _reloadWidget(size)
                    : _homeWidget(size),
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

  Widget _reloadWidget(Size size) {
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
                onPressed: () => _loadHomeData(),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xff00a46a),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                ),
                child: const Text(
                  "Reintentar",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _homeWidget(Size size) {
    return RefreshIndicator(
      onRefresh: () async {
        _loadHomeData();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TitleWidget(),
              const SizedBox(
                height: 25,
              ),
              CompanyWidget(
                size: size,
                path:
                    "${appProvider!.usuario.contribuyente!.dominio!}/${appProvider!.usuario.contribuyente!.img_logo!}",
                ruc: appProvider!.usuario.contribuyente!.ruc!,
                name: appProvider!.usuario.contribuyente!.razon_social!,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxOptionWidget(
                    size: size,
                    image: true,
                    path: "assets/realizar_venta.png",
                    title: "Realizar venta",
                    background: const Color(0xff00a46a),
                    foreground: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NewSalePage.id,
                      );
                    },
                  ),
                  BoxOptionWidget(
                    size: size,
                    image: true,
                    path: "assets/caja_chica.png",
                    title: "Caja chica",
                    background: const Color(0xffffbb00),
                    foreground: Colors.white,
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxOptionWidget(
                    size: size,
                    image: true,
                    path: "assets/ventas_echas.png",
                    title: "Ventas realizadas",
                    background: const Color(0xffd90000),
                    foreground: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SalesListPage.id,
                      );
                    },
                  ),
                  BoxOptionWidget(
                    size: size,
                    image: true,
                    path: "assets/guia_remision.png",
                    title: "Guías de remisión",
                    background: const Color(0xffc000d5),
                    foreground: Colors.white,
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxOptionWidget(
                    size: size,
                    image: true,
                    path: "assets/proformas.png",
                    title: "Proformas",
                    background: const Color(0xff6d01d9),
                    foreground: Colors.white,
                    onTap: () {},
                  ),
                  BoxOptionWidget(
                    size: size,
                    image: true,
                    path: "assets/productos.png",
                    title: "Productos",
                    background: const Color(0xff0569d9),
                    foreground: Colors.white,
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxOptionWidget(
                    size: size,
                    image: true,
                    path: "assets/resportes.png",
                    title: "Reportes",
                    background: const Color(0xff00b9ff),
                    foreground: Colors.white,
                    onTap: () {},
                  ),
                  BoxOptionWidget(
                    size: size,
                    image: false,
                    path: "assets/configuracion.svg",
                    title: "Configuración",
                    background: const Color(0xff00c8bb),
                    foreground: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CongiturationPage.id,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadHomeData() async {
    setState(() {
      message = "Cargando información, espere por favor...";
      loading = true;
      responseOk = true;
    });
    dynamic response = await appProvider!.contribuyente();
    if (response is Response) {
      var data = response.data;

      Contribuyente contribuyente = Contribuyente();
      contribuyente.ruc = data["ruc"];
      contribuyente.razon_social = data["razon_social"];
      contribuyente.img_logo = data["img_logo"];
      contribuyente.dominio = data["dominio"];

      RolUsuario rolUsuario = RolUsuario();

      appProvider!.usuario.contribuyente = contribuyente;
      appProvider!.usuario.rol_usuario = rolUsuario;

      setState(() {
        message = "";
        loading = false;
        responseOk = true;
      });

      return;
    }

    if (response is Map) {
      if (response["type"] == DioErrorType.cancel) return;

      setState(() {
        message = response["message"];
        loading = false;
        responseOk = false;
      });

      return;
    }

    if (response is String) {
      setState(() {
        message = response;
        loading = false;
        responseOk = false;
      });
    }
  }
}
