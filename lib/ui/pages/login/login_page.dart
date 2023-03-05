import 'package:appsauri/model/usuario.dart';
import 'package:appsauri/provider/app_provider.dart';
import 'package:appsauri/ui/pages/home/home_page.dart';
import 'package:appsauri/ui/pages/login/widget/input_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/activity_indicator.dart';
import '../../components/alert.dart';
import '../../constants.dart';

import 'widget/button_login_widget.dart';
import 'widget/button_recover_widget.dart';
import 'widget/button_web_widget.dart';
import 'widget/button_whatsapp_widget.dart';
import 'widget/input_text_widget.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();

  TextEditingController claveController = TextEditingController();
  FocusNode claveFocus = FocusNode();

  CancelToken cancelToken = CancelToken();
  bool loading = false;
  bool obscureText = true;

  @override
  void dispose() {
    super.dispose();
    emailFocus.dispose();
    claveFocus.dispose();
    cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    AppProvider appProvider = Provider.of<AppProvider>(context);

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
          child: Stack(
            alignment: Alignment.center,
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/tiquepos_logo.png",
                          height: 160,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ActivityIndicator(
                          color: colorPrimary,
                          loading: loading,
                          radius: 20,
                          size: 40,
                          marginBottom: 30,
                        ),
                        InputTextWidget(
                          controller: emailController,
                          width: size.width * 0.8,
                          hintText: 'Email',
                          icon: Icons.alternate_email,
                          myFocusNode: emailFocus,
                          onSubmitted: (value) async {
                            if (value != "" && claveController.text == "") {
                              claveFocus.requestFocus();
                              return;
                            }

                            if (emailController.text != "" &&
                                claveController.text != "") {
                              _onEventLogin(appProvider);
                            }
                          },
                        ),
                        InputPasswordWidget(
                          controller: claveController,
                          width: size.width * 0.8,
                          hintText: "Contraseña",
                          icon: Icons.lock,
                          obscureText: obscureText,
                          myFocusNode: claveFocus,
                          press: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          onSubmitted: (value) async {
                            if (emailController.text == "") {
                              emailFocus.requestFocus();
                              return;
                            }

                            if (emailController.text != "" &&
                                claveController.text != "") {
                              _onEventLogin(appProvider);
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                        ButtonLoginWidget(
                          size: size,
                          onPressed: () => _onEventLogin(appProvider),
                        ),
                        const SizedBox(height: 10),
                        const ButtonRecoverWidget(),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            ButtonWebWidget(),
                            ButtonWhatsappWidget(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onEventLogin(AppProvider appProvider) async {
    if (loading) {
      return;
    }

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (!emailValid(emailController.text)) {
      Alert(context: context).showAlert("Ingrese su Email.", callback: () {
        emailFocus.requestFocus();
      });
      return;
    }

    if (claveController.text.isEmpty) {
      Alert(context: context).showAlert("Ingrese su Contraseña.");
      return;
    }

    setState(() {
      loading = true;
    });

    Map<String, dynamic> payload = {
      "email": emailController.text,
      "password": claveController.text
    };

    dynamic response =
        await appProvider.login(payload, cancelToken: cancelToken);

    if (response is Response) {
      var user = response.data["user"];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("idusuario", "${user["idusuario"]}");
      prefs.setString("token", response.data["token"]);
      prefs.setString("email", emailController.text);
      prefs.setString("password", claveController.text);

      appProvider.isLoading = true;
      appProvider.isSignout = false;

      Usuario usuario = Usuario();
      usuario.idusuario = user["idusuario"];
      usuario.token = response.data["token"];
      usuario.email = emailController.text;
      usuario.password = claveController.text;
      appProvider.usuario = usuario;

      _nagivateNext();

      return;
    }

    if (response is Map) {
      if (response["type"] == DioErrorType.cancel) return;

      setState(() {
        loading = false;
      });

      Alert(context: context).showAlert(response["message"]);
      return;
    }

    Alert(context: context).showAlert(response);
  }

  void _nagivateNext() {
    Navigator.pushReplacementNamed(
      context,
      HomePage.id,
    );
  }
}
