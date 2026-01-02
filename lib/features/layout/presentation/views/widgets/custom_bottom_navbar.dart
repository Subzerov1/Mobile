import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/features/layout/presentation/views/widgets/bottom_navbar_item.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 45,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xffA8D6FA),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BottomNavItem(
              icon: Icons.home,
              label: "Home".tr(),
              route: Routes.homeView,
            ),
          ),
          Expanded(
            child: BottomNavItem(
              icon: Icons.person,
              label: "Profile".tr(),
              route: Routes.profileView,
            ),
          ),
        ],
      ),
    );
  }
}
