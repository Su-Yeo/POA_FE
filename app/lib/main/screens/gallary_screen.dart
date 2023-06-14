import 'package:app/base/components/art.dart';
import 'package:app/base/components/sorting_btn.dart';
import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum SortingBtnNames {
  latest,
  onSale,
  likes,
}

class GallaryScreen extends ConsumerStatefulWidget {
  const GallaryScreen({super.key});

  @override
  ConsumerState<GallaryScreen> createState() => _GallaryScreenState();
}

class _GallaryScreenState extends ConsumerState<GallaryScreen> {
  Future getArtWorks(WidgetRef ref, String value) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/artwork/$value',
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
        future: getArtWorks(ref, 'last'),
        builder: (_, AsyncSnapshot snapshot) {
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
              /** 버튼 */
              // SortingBtn(
              //   path: 'ddd',
              // ),
              SortingButton(path: 'like'),
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

class SortingButton extends StatefulWidget {
  final String path;
  const SortingButton({
    super.key,
    required this.path,
  });

  @override
  State<SortingButton> createState() => _SortingButtonState();
}

class _SortingButtonState extends State<SortingButton> {
  SortingBtnNames initBtnName = SortingBtnNames.latest;
  Future sorting(WidgetRef ref, path) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(path);
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _sortingBtn(
          SortingBtnNames.latest,
          () {},
        ),
        _sortingBtn(
          SortingBtnNames.likes,
          () {
            print(widget.path);
          },
        ),
        _sortingBtn(SortingBtnNames.onSale, () {}),
      ],
    );
  }

  Widget _sortingBtn(SortingBtnNames name, VoidCallback btnPressed) {
    bool isActive = name == initBtnName;
    String btnText = name.toString() == 'SortingBtnNames.latest'
        ? '최신순'
        : name.toString() == 'SortingBtnNames.onSale'
            ? '판매중'
            : '좋아요순';

    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 4.0,
        left: 4.0,
      ),
      child: TextButton(
        onPressed: isActive
            ? null
            : () {
                btnPressed();
                setState(
                  () {
                    initBtnName = name;
                  },
                );
              },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            isActive ? Colors.black : Colors.white,
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.zero,
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: isActive ? Colors.black : Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0,
          ),
          child: Text(
            btnText,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
