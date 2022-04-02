import 'package:flutter/material.dart';

import '../../../../app/theme/app_size.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;

  const RoundedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      height: AppSize.buttonHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
