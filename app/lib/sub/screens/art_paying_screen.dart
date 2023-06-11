import 'package:app/base/components/dlg_confirm.dart';
import 'package:app/common/const/format_amount.dart';
import 'package:app/common/model/demmy_model.dart';
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
            context.go('/gallary/${pathParam}/paying-result');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    pathParam = int.parse(GoRouterState.of(context).pathParameters['index']!);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '구매하기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _topInfo(),
          _divider(),
          _midInfo(),
          _divider(),
          _bottomInfo(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            confirmPurchase(context, pathParam);
          },
          child: Text(
            '구매하기',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4.0,
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

  SliverToBoxAdapter _topInfo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              models[pathParam].fileUrl,
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    models[pathParam].title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '작가정보: ${models[pathParam].creator}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    '작품가격: ${formatAmount(models[pathParam].artworkPrice.toString())}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
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
                fontWeight: FontWeight.w600,
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
        16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '구매자 정보',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
            ),
            _midInputForm(
              label: '이   름',
              input: const Text(
                '포니어',
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

  SliverPadding _bottomInfo() {
    return SliverPadding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                '결제 수단',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
            ),
            ListTile(
              dense: true,
              title: const Text('카드결제'),
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                      formatAmount(models[pathParam].artworkPrice.toString()),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              '주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.',
              style: TextStyle(
                fontSize: 10.0,
                color: lineColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

// 연락처
  TextFormField _midContactInfo() {
    return TextFormField(
      controller: _contactController,
      keyboardType: TextInputType.phone,
      decoration: customInputTheme.copyWith(hintText: '010-0000-0000'),
      onChanged: (value) {
        contactValue = value;
      },
      inputFormatters: [
        ContactInputFormatter(),
      ],
    );
  }

// 주소
  Column _midAddressInfo() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
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
            const SizedBox(
              width: 8.0,
            ),
            // 주소검색
            ElevatedButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                _addressAPI();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    4.0,
                  ),
                ),
                backgroundColor: primaryColor,
              ),
              child: const Text(
                '주소 검색',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextFormField(
          controller: _addressController2,
          keyboardType: TextInputType.streetAddress,
          decoration: customInputTheme.copyWith(
            hintText: '상세주소 입력',
          ),
          onChanged: (value) {
            addressDetailValue = value;
          },
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
