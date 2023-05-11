import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxOptionWidget extends StatelessWidget {
  final Size size;
  final bool image;
  final String path;
  final String title;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;

  const BoxOptionWidget({
    Key? key,
    required this.size,
    required this.image,
    required this.path,
    required this.title,
    required this.background,
    required this.foreground,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: onTap,
      child: Container(
        width: (size.width - 60) * 0.5,
        height: 100,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image
                ? Image.asset(
                    path,
                    height: 32,
                  )
                : SvgPicture.asset(
                    path,
                    height: 32,
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: foreground,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
