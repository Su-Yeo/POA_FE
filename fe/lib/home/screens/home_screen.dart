import 'package:fe/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseLayout(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Text(
            GoRouterState.of(context).location.toString(),
          ),
        ),
      ),
    );
  }
}
