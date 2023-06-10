import 'package:app/base/components/art.dart';
import 'package:app/base/components/sorting_btn.dart';
import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/repositories/art_work_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GallaryScreen extends ConsumerWidget {
  const GallaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<ArtWorkRepository> getArtWorks() async {
      final repository = ArtWorkRepository(ref.watch(dioProvider),
          baseUrl: 'http://192.168.71.5:8080');
      return repository;
    }

    return BaseLayout(
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: FutureBuilder<ArtWorkRepository>(
        future: getArtWorks(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SortingBtn(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 8.0,
                  ),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: models.map((data) {
                          return GestureDetector(
                            onTap: () {
                              context.go('/gallary/${data.artworkId}');
                            },
                            child: Art(
                              model: data,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
