import 'package:fe/arts/screens/arts_screen.dart';
import 'package:fe/common/layout/base_layout.dart';
import 'package:fe/home/screens/home_screen.dart';
import 'package:fe/user/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends ConsumerStatefulWidget {
  final Widget child;
  const BaseScreen({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen> {
  // int _selectedIndex = 0;
  int getIndex(BuildContext context) {
    if (GoRouterState.of(context).location == '/') {
      return 0;
    } else if (GoRouterState.of(context).location == '/arts') {
      return 1;
    } else if (GoRouterState.of(context).location == '/gallary') {
      return 2;
    } else {
      return 3;
    }
  }

  BottomNavigationBarItem _bottomNavItem({
    required String iconPath,
    required String label,
    required String activeIconPath,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        fit: BoxFit.cover,
      ),
      activeIcon: Image.asset(
        activeIconPath,
        fit: BoxFit.cover,
      ),
      label: label,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: GoRouterState.of(context).name.toString(),
      body: widget.child,
      bottomNav: BottomNavigationBar(
        currentIndex: getIndex(context),
        onTap: (index) {
          if (index == 0) {
            context.go('/');
          } else if (index == 1) {
            context.go('/arts');
          } else if (index == 2) {
            context.go('/gallary');
          } else {
            context.go('/user');
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomNavItem(
            iconPath: 'assets/icons/base_poa.png',
            activeIconPath: 'assets/icons/active_poa.png',
            label: 'Home',
          ),
          _bottomNavItem(
            iconPath: 'assets/icons/base_liked.png',
            activeIconPath: 'assets/icons/active_liked.png',
            label: 'Liked',
          ),
          _bottomNavItem(
            iconPath: 'assets/icons/base_gallary.png',
            activeIconPath: 'assets/icons/active_gallary.png',
            label: 'Gallary',
          ),
          _bottomNavItem(
            iconPath: 'assets/icons/base_buy.png',
            activeIconPath: 'assets/icons/active_buy.png',
            label: 'Buy',
          ),
        ],
      ),
    );
  }
}
