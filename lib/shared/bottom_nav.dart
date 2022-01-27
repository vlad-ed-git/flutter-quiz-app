import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizme/theme.dart';

class BottomNavItem {
  late IconData icon;
  late String label;
  late String screenPath;

  BottomNavItem(IconData aIcon, String aLbl, String path) {
    icon = aIcon;
    label = aLbl;
    screenPath = path;
  }

  BottomNavigationBarItem getBottomNavItem() {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 20,
      ),
      label: label,
    );
  }
}

class BottomNavItems {
  static var items = [
    BottomNavItem(FontAwesomeIcons.graduationCap, 'Topics', '/'),
    BottomNavItem(FontAwesomeIcons.bolt, 'About', '/about'),
    BottomNavItem(FontAwesomeIcons.userCircle, 'Profile', '/profile')
  ];

  static void onItemClicked(BuildContext context, int itemIndex) {
    if (itemIndex == 0) return; //stay here at topics
    Navigator.pushNamed(context, items[itemIndex].screenPath);
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> navItems = [];
    for (var navItem in BottomNavItems.items) {
      navItems.add(navItem.getBottomNavItem());
    }
    return BottomNavigationBar(
      items: navItems,
      onTap: (int idx) => {BottomNavItems.onItemClicked(context, idx)},
    );
  }
}
