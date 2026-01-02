import 'package:flutter/material.dart';
import 'package:subzero_mobile/features/layout/presentation/views/widgets/custom_bottom_navbar.dart';

class LayoutView extends StatelessWidget {
  final Widget child;
  const LayoutView(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Stack(
          children: [
            Positioned.fill(child: child),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomBottomNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
