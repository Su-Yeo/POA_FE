import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortingBtnNames {
  latest,
  onSale,
  likes,
}

class SortingBtn extends ConsumerStatefulWidget {
  final String path;
  const SortingBtn({
    required this.path,
    super.key,
  });

  @override
  ConsumerState<SortingBtn> createState() => _SortingBtnState();
}

class _SortingBtnState extends ConsumerState<SortingBtn> {
  SortingBtnNames initBtnName = SortingBtnNames.latest;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _sortingBtn(
          SortingBtnNames.latest,
          () {
            print(widget.path);
            print('최신순');
          },
        ),
        _sortingBtn(
          SortingBtnNames.likes,
          () {
            print(widget.path);
            print('좋아요순');
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
                btnPressed;
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

  void _updateActiveBtn(SortingBtnNames name, VoidCallback btnPressed) {
    setState(() {
      btnPressed;
      initBtnName = name;
      print("$name 이 눌렸습니다.");
    });
  }
}
