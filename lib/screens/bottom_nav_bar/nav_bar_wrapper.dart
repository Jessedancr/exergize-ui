import 'package:exergizeui/screens/bottom_nav_bar/dashboard.dart';
import 'package:exergizeui/screens/bottom_nav_bar/diet_screen.dart';
import 'package:exergizeui/screens/bottom_nav_bar/profile_screen.dart';
import 'package:exergizeui/screens/bottom_nav_bar/training.dart';
import 'package:exergizeui/widgets/exergize_nav_bar.dart';
import 'package:flutter/material.dart';

class NavBarWrapper extends StatefulWidget {
  const NavBarWrapper({super.key});

  @override
  State<NavBarWrapper> createState() => _NavBarWrapperState();
}

class _NavBarWrapperState extends State<NavBarWrapper> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    Dashboard(),
    Training(),
    DietScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ExergizeNavBar(
        onTap: _navigateBottomBar,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
