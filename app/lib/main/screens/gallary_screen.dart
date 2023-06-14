import 'package:app/base/components/art.dart';
import 'package:app/base/components/sorting_btn.dart';
import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/repositories/art_work_repository.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GallaryScreen extends ConsumerStatefulWidget {
  const GallaryScreen({super.key});

  @override
  ConsumerState<GallaryScreen> createState() => _GallaryScreenState();
}

class _GallaryScreenState extends ConsumerState<GallaryScreen> {
  Future getArtWorks(WidgetRef ref) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/artwork/last',
    );
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: FutureBuilder(
        future: getArtWorks(ref),
        builder: (_, AsyncSnapshot snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

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
                        children: snapshot.data.map<Widget>(
                          (data) {
                            final item = ArtWorkModel.fromJson(data);
                            return GestureDetector(
                              onTap: () {
                                context.go('/gallary/${item.artworkId}');
                              },
                              child: Art(
                                model: item,
                              ),
                            );
                          },
                        ).toList(),
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
