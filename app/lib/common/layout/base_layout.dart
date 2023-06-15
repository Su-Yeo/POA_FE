import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;
  final Widget? appBarTitle;
  final Widget? bottomNav;
  final bool needBottomNav;
  final bool needAppBar;
  final BottomAppBar? bottomAppBar;
  const BaseLayout({
    super.key,
    required this.body,
    this.appBarTitle,
    this.bottomAppBar,
    this.bottomNav,
    this.needAppBar = false,
    this.needBottomNav = true,
  });

  // 1. 앱바
  AppBar? _appBar(BuildContext context) {
    if (needAppBar) return null;
    return AppBar(
      shape: const Border(
        bottom: BorderSide(
          color: Colors.grey, // 선의 색상
          width: 1.0, // 선의 두께
        ),
      ),
      toolbarHeight: 50,
      backgroundColor: Colors.white,
      elevation: 0,
      title: appBarTitle ??
          Text(
            GoRouterState.of(context).name.toString(),
          ),
    );
  }

  // 2. 바디
  Widget _body() {
    return SafeArea(
      child: body,
    );
  }

  // 3. 바텀바
  BottomNavigationBar _bottomNav(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: lineColor,
      selectedItemColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        if (index == 0) {
          context.go('/home');
        } else if (index == 1) {
          context.go('/like');
        } else if (index == 2) {
          context.go('/gallary');
        } else {
          context.go('/user');
        }
        // controller.animateTo(index);
      },
      currentIndex: getIndex(context),
      items: [
        _bottomNavItem(
          iconPath: 'assets/icons/base_poa.png',
          activeIconPath: 'assets/icons/active_poa.png',
          label: 'Home',
          isActive: getIndex(context) == 0,
        ),
        _bottomNavItem(
          iconPath: 'assets/icons/base_like.png',
          activeIconPath: 'assets/icons/active_like.png',
          label: 'Like',
          isActive: getIndex(context) == 1,
        ),
        _bottomNavItem(
          iconPath: 'assets/icons/base_gallary.png',
          activeIconPath: 'assets/icons/active_gallary.png',
          label: 'Gallary',
          isActive: getIndex(context) == 2,
        ),
        _bottomNavItem(
          iconPath: 'assets/icons/base_user.png',
          activeIconPath: 'assets/icons/active_user.png',
          label: 'User',
          isActive: getIndex(context) == 3,
        ),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavItem({
    required String iconPath,
    required String label,
    required String activeIconPath,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        fit: BoxFit.cover,
        width: 50,
      ),
      activeIcon: Image.asset(
        activeIconPath,
        fit: BoxFit.cover,
        width: 50,
      ),
      label: label,
    );
  }

  int getIndex(BuildContext context) {
    if (GoRouterState.of(context).location == '/home') {
      return 0;
    } else if (GoRouterState.of(context).location == '/like') {
      return 1;
    } else if (GoRouterState.of(context).location == '/gallary') {
      return 2;
    } else {
      return 3;
    }
  }

  // 3-2. 바텀앱바
  BottomAppBar _bottomAppBar() {
    return bottomAppBar!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      // bottomNavigationBar: bottomNav,
      bottomNavigationBar:
          needBottomNav ? _bottomNav(context) : _bottomAppBar(),
    );
  }
}
