import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/circular_container.dart';
import 'package:t_store/common/widgets/clip_path.dart';
import 'package:t_store/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            const Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(),
            ),
            const Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
