import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class BottomNavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String route;
  const BottomNavItem({
    super.key,
    required this.route,
    required this.icon,
    required this.label,
  });

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  String? get location => context.router.state.path;
  bool get isSelected => location?.contains(widget.route) ?? false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.go(widget.route),
      child: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            if (isSelected)
              Text(
                widget.label,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Icon(
              widget.icon,
              color: isSelected ? Colors.white : Colors.blueGrey,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
