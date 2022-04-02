import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  return mediaQueryData.size.width;
}

double screenHeight(BuildContext context) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  return mediaQueryData.size.height;
}
