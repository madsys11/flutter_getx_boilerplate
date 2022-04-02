import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final bool loading;
  final Widget child;
  const LoadingContainer({Key? key, this.loading = false, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading) _buildLoading(),
      ],
    );
  }

  AbsorbPointer _buildLoading() {
    return AbsorbPointer(
      absorbing: loading,
      child: Container(
        color: Colors.black12,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
