import 'package:appsauri/ui/constants.dart';
import 'package:flutter/material.dart';

class ButtonWebWidget extends StatelessWidget {
  const ButtonWebWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: const Color(0xffe0e0e0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: const Color(0xffffffff),
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 10,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.desktop_mac,
                color: Color(0xff00a46a),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Web",
                style: TextStyle(
                  color: colorPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
