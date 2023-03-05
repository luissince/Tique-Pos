import 'package:appsauri/ui/constants.dart';
import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  final double width;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FocusNode myFocusNode;
  final ValueChanged<String>? onSubmitted;
  final Function()? press;

  const InputPasswordWidget({
    Key? key,
    required this.controller,
    required this.width,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    this.onChanged,
    required this.myFocusNode,
    this.onSubmitted,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      // width: size.width * 0.8,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: const Color(0xffe0e0e0),
        ),
      ),
      child: TextFormField(
        focusNode: myFocusNode,
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon),
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: press,
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: colorPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
