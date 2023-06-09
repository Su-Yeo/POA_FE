import 'package:app/base/screens/splash_screen.dart';
import 'package:app/main/screens/gallary_screen.dart';
import 'package:app/main/screens/home_screen.dart';
import 'package:app/main/screens/like_screen.dart';
import 'package:app/main/screens/user_screen.dart';
import 'package:app/sub/screens/art_detail_screen.dart';
import 'package:app/sub/screens/art_paying_result_screen.dart';
import 'package:app/sub/screens/art_paying_screen.dart';
import 'package:app/sub/screens/creator_info_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'Home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/like',
      name: 'Like',
      builder: (context, state) => const LikeScreen(),
    ),
    GoRoute(
      path: '/gallary',
      name: 'Gallary',
      builder: (context, state) => const GallaryScreen(),
      routes: [
        GoRoute(
          path: ':index',
          name: 'ArtDetail',
          builder: (context, state) => ArtDetailScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'paying',
              name: 'ArtPaying',
              builder: (context, state) => ArtPayingScreen(),
            ),
            GoRoute(
              path: 'paying-result',
              name: 'ArtPayingResult',
              builder: (context, state) => ArtPayingResultScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/user',
      name: 'User',
      builder: (context, state) => const UserScreen(),
      routes: [
        GoRoute(
          path: ':index',
          name: 'CreatorDetail',
          builder: (context, state) => CreatorInfoScreen(),
        ),
      ],
    ),
  ],
);
