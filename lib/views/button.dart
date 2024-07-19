import 'dart:math';
import 'package:flutter/material.dart';

num degToRad(num deg) => deg * (pi / 180.0);

class MyClipper extends CustomClipper<Path> {
  final double _borderRadius; // percentage of the shortest side
  final double _angle;

  MyClipper({
    required double borderRadius,
    required double angle,
  })  : _borderRadius = borderRadius,
        _angle = angle;

  @override
  Path getClip(Size size) {
    final borderRadius = _borderRadius * size.shortestSide;
    final dx = borderRadius * cos(degToRad(_angle));
    final dy = borderRadius * sin(degToRad(_angle));
    final dX = size.height / tan(degToRad(_angle));
    Path path = Path()
      ..moveTo(borderRadius, size.height)
      ..quadraticBezierTo(0, size.height, dx, size.height - dy)
      ..lineTo(dX - dx, dy)
      ..quadraticBezierTo(dX, 0, dX + borderRadius, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width - dx, dy)
      ..lineTo(size.width - dX + dx, size.height - dy)
      ..quadraticBezierTo(size.width - dX, size.height,
          size.width - dX - borderRadius, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
