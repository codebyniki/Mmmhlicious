import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MmmhliciousNavBar extends StatelessWidget {
  MmmhliciousNavBar({super.key, required this.currentIndex, required this.onChanged});

  final int currentIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<IconData> icons = [
      IconsaxPlusLinear.home_1,
      IconsaxPlusLinear.search_status,
      IconsaxPlusLinear.message,
      IconsaxPlusLinear.user_octagon
    ];

    return SizedBox(
      height: 74,
      child: AnimatedBottomNavigationBar(
        icons: icons,
        iconSize: 24,
        backgroundColor: colorScheme.surfaceContainerHighest,
        inactiveColor: colorScheme.surface,
        activeColor: colorScheme.primary,
        activeIndex: currentIndex,
        onTap: onChanged,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        shadow: Shadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, -2),
          blurRadius: 8,
        ),
      ),
    );
  }
}
