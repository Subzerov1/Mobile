import 'package:flutter/material.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/about%20us%20view/about_us_view_body.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/about%20us%20view/about_us_view_header.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AboutUsViewHeader(),
      body: AboutUsViewBody(),
    );
  }
}
