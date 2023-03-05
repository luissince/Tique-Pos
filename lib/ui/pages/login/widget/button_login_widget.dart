import 'package:appsauri/ui/constants.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  final Size size;
  final VoidCallback onPressed;

  const ButtonLoginWidget({
    Key? key,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: 55,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: colorPrimary,
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
          ),
          child: const Text(
            "Ingresar",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
