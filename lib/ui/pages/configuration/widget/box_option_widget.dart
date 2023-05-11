import 'package:appsauri/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxOptionWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool image;
  final String? path;
  final IconData? icon;
  final double? pathSize;
  final double? iconSize;
  final String title;
  final String subTitle;

  const BoxOptionWidget({
    Key? key,
    required this.onTap,
    required this.image,
    this.path,
    this.pathSize,
    this.icon,
    this.iconSize = 29,
    required this.title,
    required this.subTitle,
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
        margin: const EdgeInsets.only(
          bottom: 15,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorPrimary,
              ),
              child: image
                  ? SvgPicture.asset(
                      path!,
                      height: pathSize,
                    )
                  : Icon(
                      icon,
                      color: Colors.white,
                      size: iconSize,
                    ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
