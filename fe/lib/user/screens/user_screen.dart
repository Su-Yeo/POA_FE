import 'package:fe/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseLayout(
      body: Container(
        color: Colors.lightGreen,
        child: Center(
          child: Text(
            GoRouterState.of(context).location.toString(),
          ),
        ),
      ),
    );
  }
}
