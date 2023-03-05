import 'package:flutter/material.dart';

import '../../../components/activity_indicator.dart';

class SimpleDialogWidget {
  // Future<void> showSimpleDialog(BuildContext context) async => await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SimpleDialog(
  //           title: const Text('Select Option'),
  //           children: <Widget>[
  //             SimpleDialogOption(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
  //               onPressed: () {
  //                 // showSnackBar(context, title: 'Selected Option 1');
  //                 Navigator.pop(context);
  //               },
  //               child: const Text('Option 1', style: TextStyle(fontSize: 16)),
  //             ),
  //             SimpleDialogOption(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
  //               child: const Text('Option 2', style: TextStyle(fontSize: 16)),
  //               onPressed: () {
  //                 // showSnackBar(context, title: 'Selected Option 2');
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             SimpleDialogOption(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
  //               child: const Text('Option 3', style: TextStyle(fontSize: 16)),
  //               onPressed: () {
  //                 // showSnackBar(context, title: 'Selected Option 3');
  //                 Navigator.pop(context);
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );

  // Future<void> showAlertDialog(BuildContext context) async => await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return WillPopScope(
  //           onWillPop: () async {
  //             return false;
  //           },
  //           child: AlertDialog(
  //             title: const Text('Sample Alert Dialog'),
  //             content: const Text(
  //               'This is an implementation of the AlertDialog widget in Flutter',
  //             ),
  //             actions: [
  //               OutlinedButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: const Text('Close'),
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     );

  static Future<void> showCustomDialog(BuildContext context,
          {String message = 'Cerrando sesión...'}) async =>
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
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
                                    fontSize: 21,
                                  ),
                                ),
                                Text(
                                  "POS",
                                  style: TextStyle(
                                      color: Color(0xff00a46a),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const ActivityIndicator(
                      color: Color(0xff00a46a),
                      loading: false,
                      radius: 20,
                      size: 40,
                      marginBottom: 30,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      );

  // void showAboutDialogWidget(BuildContext context) {
  //   showAboutDialog(
  //     context: context,
  //     applicationIcon: const FlutterLogo(),
  //     applicationVersion: '1.0.0',
  //     applicationName: 'Dialogs Example',
  //     applicationLegalese: 'Johannes',
  //   );
  // }
}
