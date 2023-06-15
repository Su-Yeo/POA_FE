import 'package:app/common/providers/active_btn_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortingBtnNames {
  latest,
  onSale,
  likes,
}

class SortingBtn extends ConsumerStatefulWidget {
  const SortingBtn({
    super.key,
  });

  @override
  ConsumerState<SortingBtn> createState() => _SortingBtnState();
}

class _SortingBtnState extends ConsumerState<SortingBtn> {
  SortingBtnNames initBtnName = SortingBtnNames.latest;

  String activeButon = '최신순';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activeButtonNotifierProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _sortingBtn(
          SortingBtnNames.latest,
          () {
            setState(() {
              activeButon = '최신순';
              state.setActiveButton(
                btnName: activeButon,
              );
            });
          },
          state.getActiveButton == '최신순',
        ),
        _sortingBtn(
          SortingBtnNames.likes,
          () {
            setState(() {
              activeButon = '좋아요순';
              state.setActiveButton(
                btnName: activeButon,
              );
            });
          },
          state.getActiveButton == '좋아요순',
        ),
        _sortingBtn(
          SortingBtnNames.onSale,
          () {
            setState(() {
              activeButon = '판매중';
              state.setActiveButton(
                btnName: activeButon,
              );
            });
          },
          state.getActiveButton == '판매중',
        ),
      ],
    );
  }

  Widget _sortingBtn(
      SortingBtnNames name, VoidCallback btnPressed, bool isActive) {
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
