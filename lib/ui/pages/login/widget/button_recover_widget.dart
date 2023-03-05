import 'package:flutter/material.dart';

class ButtonRecoverWidget extends StatelessWidget {
  const ButtonRecoverWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text(
      "¿Olvidaste tu contraseña?",
      style: TextStyle(
        color: Color(0xff868e96),
      ),
    );
  }
}
