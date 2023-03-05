import 'package:appsauri/ui/pages/login/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../model/usuario.dart';
import '../../../provider/app_provider.dart';
import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  static String id = "splash_page";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppProvider? appProvider;

  _SplashPageState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        Future.delayed(
          const Duration(seconds: 3),
          () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            if (prefs.getString("token") != null) {
              _nagivateHome(prefs);
            } else {
              _navigateLogin();
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    appProvider = Provider.of<AppProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/tiquepos_logo.png",
                        height: 160,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "TIQUE",
                            style: TextStyle(
                              color: Color(0xff00a46a),
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "POS",
                            style: TextStyle(
                                color: Color(0xff00a46a),
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FutureBuilder(
                        future: _getPackageInfo(),
                        builder: (BuildContext context,
                            AsyncSnapshot<PackageInfo> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Text(
                                "V 0.0.1",
                                style: TextStyle(
                                  color: Color(0xff00a46a),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              );
                            }
                            final data = snapshot.data!;
                            return Text(
                              data.version,
                              style: const TextStyle(
                                color: Color(0xff00a46a),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            );
                          } else {
                            return const Text(
                              "Cargando versión...",
                              style: TextStyle(
                                color: Color(0xff00a46a),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    width: size.width - 40.00,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: LinearProgressIndicator(
                        backgroundColor: Color(0xffdadada),
                        color: Color(0xff00a46a),
                        minHeight: 6.0,
                        // value: 0.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _nagivateHome(SharedPreferences prefs) async {
    appProvider!.isLoading = true;
    appProvider!.isSignout = false;

    Usuario usuario = Usuario();
    usuario.idusuario = int.parse(prefs.getString("idusuario")!);
    usuario.token = prefs.getString("token");
    usuario.email = prefs.getString("email");
    usuario.password = prefs.getString("password");
    appProvider!.usuario = usuario;

    bool token = await _validToken();

    if (token) {
      _navigateHome();
    } else {
      Map<String, dynamic> payload = {
        "email": prefs.getString("email"),
        "password": prefs.getString("password"),
      };

      dynamic response = await appProvider!.login(payload);

      if (response is Response) {
        var user = response.data["user"];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();

        prefs.setString("idusuario", "${user["idusuario"]}");
        prefs.setString("token", response.data["token"]);
        prefs.setString("email", prefs.getString("email")!);
        prefs.setString("password", prefs.getString("password")!);

        appProvider!.isLoading = true;
        appProvider!.isSignout = false;

        Usuario usuario = Usuario();
        usuario.idusuario = user["idusuario"];
        usuario.token = response.data["token"];
        usuario.email = prefs.getString("email");
        usuario.password = prefs.getString("password");
        appProvider!.usuario = usuario;

        _navigateHome();
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();

        appProvider!.isLoading = false;
        appProvider!.isSignout = true;

        Usuario usuario = Usuario();
        appProvider!.usuario = usuario;

        _navigateLogin();
      }
    }
  }

  void _navigateLogin() {
    Navigator.pushReplacementNamed(
      context,
      LoginPage.id,
    );
  }

  void _navigateHome() {
    Navigator.pushReplacementNamed(
      context,
      HomePage.id,
    );
  }

  Future<bool> _validToken() async {
    dynamic response = await appProvider!.validtoken();
    if (response is Response) return true;

    if (response is Map) return false;

    return false;
  }

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }
}
