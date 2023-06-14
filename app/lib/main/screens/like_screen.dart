import 'package:app/base/components/art.dart';
import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LikeScreen extends ConsumerStatefulWidget {
  const LikeScreen({super.key});

  @override
  ConsumerState<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends ConsumerState<LikeScreen> {
  Future getLikeArtWorks(WidgetRef ref) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/artwork/wishlist',
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
        future: getLikeArtWorks(ref),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                child: Text(
                  '관심있는 작품 (${snapshot.data.length})',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
