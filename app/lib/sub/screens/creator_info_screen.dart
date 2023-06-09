import 'package:app/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatorInfoScreen extends ConsumerStatefulWidget {
  const CreatorInfoScreen({super.key});

  @override
  ConsumerState<CreatorInfoScreen> createState() => _CreatorInfoScreenState();
}

class _CreatorInfoScreenState extends ConsumerState<CreatorInfoScreen> {
  // 장애정보 토글여부
  bool isToggled = false;

  void toggle() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: Text(
        '작가 소개',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _topCreatorInfo(
            htmlStory:
                '포용은 사랑이예요! \n정은혜 작가는 서로 다른 사람을 그립니다. \n개개인의 고유한 특성을 담은 그림을 통해 사람이 갖고 있는 아름다움을 전달합니다.',
            imagePath: 'assets/images/user_profile.png',
          ),
          _toggleContainer(isToggled: isToggled, content: '다운 증후군은 가장 흔한....'),
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
                          '다운 증후군',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '작가 이름',
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
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
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
                                Expanded(
                                  flex: 4,
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

class WBox extends StatelessWidget {
  final Color color;
  final String title;
  const WBox({
    super.key,
    required this.color,
    this.title = '안녕',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: color,
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
