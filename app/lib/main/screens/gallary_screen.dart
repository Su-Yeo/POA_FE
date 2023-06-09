import 'package:app/base/components/art.dart';
import 'package:app/base/components/sorting_btn.dart';
import 'package:app/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GallaryScreen extends ConsumerWidget {
  const GallaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseLayout(
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SortingBtn(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 8.0,
              ),
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.go('/gallary/${index}');
                      },
                      child: Art(),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
