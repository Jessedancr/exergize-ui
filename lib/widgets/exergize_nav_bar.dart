// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExergizeNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;
  const ExergizeNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      currentIndex: selectedIndex,
      elevation: 0.0,
      onTap: onTap,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 11),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/dashboard.svg',
            color: selectedIndex == 0 ? Color(0xFF7261E1) : Colors.black,
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/training.svg',
            color: selectedIndex == 1 ? Color(0xFF7261E1) : Colors.black,
          ),
          label: 'Training',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/diet.svg',
            color: selectedIndex == 2 ? Color(0xFF7261E1) : Colors.black,
          ),
          label: 'Diet',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/profile.svg',
            color: selectedIndex == 3 ? Color(0xFF7261E1) : Colors.black,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
