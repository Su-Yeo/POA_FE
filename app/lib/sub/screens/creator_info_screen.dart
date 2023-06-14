import 'package:app/base/components/art.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/model/creator_model.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreatorInfoScreen extends ConsumerStatefulWidget {
  const CreatorInfoScreen({super.key});

  @override
  ConsumerState<CreatorInfoScreen> createState() => _CreatorInfoScreenState();
}

class _CreatorInfoScreenState extends ConsumerState<CreatorInfoScreen> {
  // 장애정보 토글여부
  bool isToggled = false;
  int pathParam = 0;

  void toggle() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  Future getCreatorInfo(WidgetRef ref, int index) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/findCreator/$index',
    );
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    CreatorModel item;
    pathParam = int.parse(GoRouterState.of(context).pathParameters['index']!);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '작가 소개',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getCreatorInfo(ref, pathParam),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          item = CreatorModel.fromJson(snapshot.data);
          return CustomScrollView(
            slivers: [
              _topCreatorInfo(
                htmlStory: item.story,
                imagePath: 'assets/images/user_profile.png',
                item: item,
              ),
              _toggleContainer(
                isToggled: isToggled,
                content: item.name,
                item: item,
              ),
              _divider(),
              _bottomTitle(
                item: item,
              ),
              // _bottomGallary(),
            ],
          );
        },
      ),
    );
  }

  SliverPadding _topCreatorInfo({
    required String htmlStory,
    required String imagePath,
    required CreatorModel item,
  }) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/creator_profile.png',
                  fit: BoxFit.cover,
                  width: 150,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          item.disabledType,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '작가 ${item.name}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 작가 소개
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                htmlStory,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 8.0,
            // ),
          ],
        ),
      ),
    );
  }

  SliverPadding _toggleContainer({
    required bool isToggled,
    required String content,
    required CreatorModel item,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: toggle,
              child: Text(
                !isToggled ? '장애 정보 ∨' : '장애 정보 ∧',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ),
            isToggled
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      child: Text(
                        item.disabledText,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }

  SliverPadding _bottomTitle({
    required CreatorModel item,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '작가의 갤러리',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: item.artworkDtoList.map(
                  (data) {
                    return GestureDetector(
                      onTap: () {
                        context.go('/gallary/${data.artworkId}');
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Art(
                          model: data,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
