import 'package:flutter/material.dart';

bool isTablet(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  const tabletThreshold = 600.0;
  return size.shortestSide >= tabletThreshold;
}