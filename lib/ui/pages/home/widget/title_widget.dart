import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/tiquepos_logo.png",
              height: 40,
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
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 0),
            elevation: 0,
            primary: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          child: const Icon(
            CupertinoIcons.ellipsis_vertical,
            color: Color(0xff00a46a),
            size: 32,
          ),
        ),
      ],
    );
  }
}
