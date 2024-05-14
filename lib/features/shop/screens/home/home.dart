import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/app_bar.dart';
import 'package:t_store/common/widgets/circular_container.dart';
import 'package:t_store/common/widgets/custome_curve_ages.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                 BaseAppBar(
                   title: Column(
                     children: [
                     ],
                   ),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPathWidget(
      child: SizedBox(
        height: 400,
        child: Container(
          color: TColors.primary,
          child:  Stack(
            children: [
              Positioned(top: -150, right: -250, child: CircularContainer()),
              Positioned(top: 100, right: -300, child: CircularContainer()),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({
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
