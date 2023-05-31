import 'package:fe/arts/screens/arts_screen.dart';
import 'package:fe/common/screens/base_screen.dart';
import 'package:fe/common/screens/splash_screen.dart';
import 'package:fe/home/screens/home_screen.dart';
import 'package:fe/user/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _glovalNavigatorKey =
    GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _glovalNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => BaseScreen(
        child: child,
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/arts',
          builder: (context, state) => ArtsScreen(),
        ),
        GoRoute(
          path: '/gallary',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/user',
          builder: (context, state) => UserScreen(),
        ),
      ],
    ),
  ],
);
