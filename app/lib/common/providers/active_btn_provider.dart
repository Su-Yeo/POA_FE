import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeButtonNotifierProvider =
    StateNotifierProvider<ActiveButtonNotifier, String>(
  (ref) => ActiveButtonNotifier(),
);

class ActiveButtonNotifier extends StateNotifier<String> {
  ActiveButtonNotifier() : super('최신순');

  void setActiveButton({
    required String btnName,
  }) {
    state = btnName;
    print(state);
  }

  String getActiveButton() {
    return state;
  }

  // get getActiveButton => state;
}
