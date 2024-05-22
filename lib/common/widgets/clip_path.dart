import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custome_curve_ages.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedAges(),
      child: child,
    );
  }
}
