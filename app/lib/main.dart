import 'package:app/common/router/app_router.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:app/common/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // runApp 시작 전에 위젯 바인딩
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  // 테마: 라이트 or 다크
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currMode, __) {
        mode(currMode);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: currMode,
          darkTheme: darkThemeData,
          theme: lightThemeData,
          // home: SplashScreen(
          //   themeNotifier: themeNotifier,
          // ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
