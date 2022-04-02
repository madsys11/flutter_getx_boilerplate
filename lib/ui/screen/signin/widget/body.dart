import 'package:flutter/material.dart';

import '../../../../app/theme/app_color.dart';
import 'signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      child: const SigninForm(),
    );
  }
}
