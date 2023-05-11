import 'package:flutter/material.dart';

class Alert {
  BuildContext context;

  Alert({required this.context});

  void showAlert(String response, {Function()? callback}) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "assets/tiquepos_logo.png",
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: const [
                  Text(
                    "TIQUE",
                    style: TextStyle(
                      color: Color(0xff00a46a),
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "POS",
                    style: TextStyle(
                        color: Color(0xff00a46a),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  )
                ],
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  response,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Aceptar',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff00a46a)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (callback != null) callback();
              },
            ),
          ],
        );
      },
    );
  }

  void showConfirm(String response,
      {Function()? aceptar, Function()? cancelar}) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "assets/tiquepos_logo.png",
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: const [
                  Text(
                    "TIQUE",
                    style: TextStyle(
                      color: Color(0xff00a46a),
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "POS",
                    style: TextStyle(
                        color: Color(0xff00a46a),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  )
                ],
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  response,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Aceptar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff00a46a)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (aceptar != null) aceptar();
              },
            ),
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff00a46a)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (cancelar != null) cancelar();
              },
            ),
          ],
        );
      },
    );
  }
}
