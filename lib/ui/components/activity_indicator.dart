import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  final Color? color;
  final bool? loading;
  final double? marginTop;
  final double? marginBottom;
  final double? radius;
  final double? size;
  const ActivityIndicator({
    Key? key,
    this.color = const Color(0xff00a46a),
    this.loading = true,
    this.radius = 15,
    this.size = 30,
    this.marginTop = 0,
    this.marginBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!loading!) {
      return const SizedBox(
        height: 0,
      );
    }
    if (Platform.isIOS) {
      return Column(
        children: [
          SizedBox(
            height: marginTop,
          ),
          CupertinoActivityIndicator(radius: radius!, color: color),
          SizedBox(
            height: marginBottom,
          ),
        ],
      );
    } else if (Platform.isAndroid) {
      return Column(
        children: [
          SizedBox(
            height: marginTop,
          ),
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(color: color),
          ),
          SizedBox(
            height: marginBottom,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: marginTop,
          ),
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(color: color),
          ),
          SizedBox(
            height: marginBottom,
          ),
        ],
      );
    }
  }
}
