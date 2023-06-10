import 'package:intl/intl.dart';

String formatAmount(String amount) {
  final formatter = NumberFormat("#,###"); // 숫자를 포맷하는 NumberFormat 객체 생성
  final parsedAmount = int.parse(amount); // 문자열 금액을 정수로 변환
  final formattedAmount = formatter.format(parsedAmount); // 포맷 적용
  return '$formattedAmount원'; // 변환된 금액 문자열 반환
}
