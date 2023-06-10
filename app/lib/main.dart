import 'package:app/common/router/app_router.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      theme: customThemeData,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
