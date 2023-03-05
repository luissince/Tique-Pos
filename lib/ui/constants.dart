import 'package:flutter/material.dart';

Color colorPrimary = const Color(0xff00a46a);

Color colorBorderInput = const Color(0xffe0e0e0);

Color colorBlack = const Color(0xff353535);

bool emailValid(String email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);

String formatMoney(double n) {
  return n.toStringAsFixed(2);
}

// void showSnackBar(BuildContext context, {String title = ""}) =>
//     Scaffold.of(context)
//       ..removeCurrentSnackBar()
//       ..showSnackBar(SnackBar(content: Text(title)));
