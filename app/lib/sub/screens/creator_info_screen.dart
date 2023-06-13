import 'package:app/base/components/art.dart';
import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/demmy_model.dart';
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

  @override
  Widget build(BuildContext context) {
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
      body: CustomScrollView(
        slivers: [
          _topCreatorInfo(
            htmlStory: models[pathParam].userName,
            imagePath: 'assets/images/user_profile.png',
          ),
          _toggleContainer(
            isToggled: isToggled,
            content: models[pathParam].userName,
          ),
          _divider(),
          _bottomTitle(),
          // _bottomGallary(),
        ],
      ),
    );
  }

  SliverPadding _topCreatorInfo({
    required String htmlStory,
    required String imagePath,
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
                    padding: EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'd',
                          // models[pathParam].disableType,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '작가 ${models[pathParam].userName}',
                          style: TextStyle(
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
                style: TextStyle(
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
  }) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
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
                        content,
                        style: TextStyle(
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
    return SliverToBoxAdapter(
      child: Divider(),
    );
  }

  SliverPadding _bottomTitle() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
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
                children: models.map((data) {
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
                }).toList(),
                // children: [1, 2, 3, 4, 5].map(
                //   (index) {
                //     return Builder(
                //       builder: (BuildContext context) {
                //         return GestureDetector(
                //           onTap: () {},
                //           child: Column(
                //             children: [
                //               Expanded(
                //                 flex: 4,
                //                 child: Card(
                //                   elevation: 4,
                //                   child: Image.asset(
                //                     'assets/images/image${index}.jpg',
                //                     fit: BoxFit.cover,
                //                     width: MediaQuery.of(context).size.width *
                //                         0.7,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         );
                //       },
                //     );
                //   },
                // ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _bottomGallary() {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        width: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [1, 2, 3, 4, 5].map(
              (index) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        print(index);
                      },
                      child: Column(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Card(
                              elevation: 4,
                              child: Image.asset(
                                'assets/images/image${index}.jpg',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
