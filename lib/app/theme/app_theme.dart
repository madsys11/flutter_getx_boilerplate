import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData appThemeData(BuildContext context) => ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColor.text),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: AppColor.primary,
            secondary: AppColor.secondary,
          ),
    );
