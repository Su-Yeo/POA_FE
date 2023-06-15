import 'package:app/base/components/dlg_confirm.dart';
import 'package:app/common/const/format_amount.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class ArtPayingScreen extends ConsumerStatefulWidget {
  const ArtPayingScreen({super.key});

  @override
  ConsumerState<ArtPayingScreen> createState() => _ArtPayingScreenState();
}

class _ArtPayingScreenState extends ConsumerState<ArtPayingScreen> {
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController1 = TextEditingController();
  final TextEditingController _addressController2 = TextEditingController();
  String contactValue = '';
  String addressValue = '';
  String addressDetailValue = '';
  String selectPayOption = '';
  int pathParam = 0;
  bool checkTerm = false;

  @override
  void dispose() {
    _contactController.dispose();
    _addressController1.dispose();
    _addressController2.dispose();
    super.dispose();
  }

  void confirmPurchase(BuildContext context, int pathParam) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DlgConfirm(
          onConfirm: () {
            context.pop(context);
            context.go('/gallary/$pathParam/paying-result');
          },
        );
      },
    );
  }

  Future getBuyingDetail(WidgetRef ref, int index) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/artwork/$index',
    );
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    ArtWorkModel item;
    pathParam = int.parse(GoRouterState.of(context).pathParameters['index']!);
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey, // 선의 색상
            width: 1.0, // 선의 두께
          ),
        ),
        title: const Text(
          '구매하기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getBuyingDetail(
          ref,
          pathParam,
        ),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          item = ArtWorkModel.fromJson(snapshot.data);
          return CustomScrollView(
            slivers: [
              _topInfo(item),
              _divider(),
              _midInfo(),
              _divider(),
              _bottomInfo(item),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            confirmPurchase(context, pathParam);
          },
          child: const Text(
            '구매하기',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            backgroundColor: primaryColor,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }

/* 그림 인포 */
  SliverToBoxAdapter _topInfo(item) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            Image.network(
              item.fileUrl,
              fit: BoxFit.contain,
              width: 150,
              // height: 100,
            ),
            const SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '작가정보: ${item.userName}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    '작품가격: ${formatAmount(item.artworkPrice.toString())}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Mid Input
  Widget _midInputForm({
    required String label,
    required Widget input,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
          ),
          Expanded(
            child: input,
          ),
        ],
      ),
    );
  }

  // 중간
  SliverPadding _midInfo() {
    return SliverPadding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                '구매자 정보',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
            ),
            _midInputForm(
              label: '이   름',
              input: const Text(
                '최호영',
              ),
            ),
            _midInputForm(
              label: '연락처',
              input: _midContactInfo(),
            ),
            _midInputForm(
              label: '주   소',
              input: _midAddressInfo(),
            ),
            // _midInputForm(
            //   label: '이메일',
            //   input: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         '가입시 이메일 정보 불러오기',
            //       ),
            //       Text(
            //         '* 위 연락처와 이메일로 구매 관련 소식이 전달됩니다.',
            //         style: TextStyle(
            //           fontSize: 10.0,
            //           color: lineColor,
            //         ),
            //       ),
            //       Text(
            //         '* 연락처 및 이메일 변경은 설정 > 계정에서 가능합니다.',
            //         style: TextStyle(
            //           fontSize: 10.0,
            //           color: lineColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  SliverPadding _bottomInfo(item) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '결제 수단',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            ListTile(
              // dense: true,
              title: const Text(
                '카드결제',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Radio(
                autofocus: true,
                value: '카드결제',
                activeColor: Colors.red,
                groupValue: selectPayOption,
                onChanged: (value) {
                  setState(() {
                    selectPayOption = value as String;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        '최종 결제 금액',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatAmount(item.artworkPrice.toString()),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                left: 32.0,
              ),
              child: Text(
                '주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.0,
                  color: lineColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: checkTerm,
                        activeColor: Colors.red,
                        onChanged: (bool? value) {
                          setState(() {
                            checkTerm = !checkTerm;
                          });
                        },
                      ),
                      const Text(
                        '개인정보 제3 자 제공 동의',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '내용보기',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// 연락처
  Widget _midContactInfo() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: _contactController,
        keyboardType: TextInputType.phone,
        decoration: customInputTheme.copyWith(
          hintText: '010-0000-0000',
        ),
        onChanged: (value) {
          contactValue = value;
        },
        inputFormatters: [
          ContactInputFormatter(),
        ],
      ),
    );
  }

// 주소
  Column _midAddressInfo() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  controller: _addressController1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: customInputTheme.copyWith(
                    hintText: '주소지를 검색하세요',
                  ),
                  onChanged: (value) {
                    addressValue = value;
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            // 주소검색
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  _addressAPI();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(
                      0.0,
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  '주소 검색',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: _addressController2,
            keyboardType: TextInputType.streetAddress,
            decoration: customInputTheme.copyWith(
              hintText: '상세주소 입력',
            ),
            onChanged: (value) {
              addressDetailValue = value;
            },
          ),
        ),
      ],
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _addressController1.text =
        '${model.zonecode!} ${model.address!} ${model.buildingName!}';
  }
}

class ContactInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final formattedValue = _getFormattedContact(newValue.text);
    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  String _getFormattedContact(String value) {
    value = value.replaceAll('-', ''); // 하이픈 제거

    if (value.length > 11) {
      value = value.substring(0, 11); // 최대 10자리까지만 유지
    }

    final buffer = StringBuffer();
    for (var i = 0; i < value.length; i++) {
      buffer.write(value[i]);
      if (i == 2 || i == 6) {
        buffer.write('-'); // 하이픈 추가
      }
    }

    return buffer.toString();
  }
}
