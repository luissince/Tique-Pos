import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCardWidget extends StatelessWidget {
  final String path;
  final Function() onPressed;

  const ButtonCardWidget({
    Key? key,
    required this.path,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          onPrimary: const Color(0xff00a46a),
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(0, 0),
          padding: const EdgeInsets.all(10.0),
          side: const BorderSide(
            color: Color(0xff00a46a),
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          path,
          height: 32,
        ),
      ),
    );
  }
}
