import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/thememodel.dart';

final themeProvider = StateNotifierProvider<MyTheme, ThemeModel>((ref) {
  return MyTheme(ThemeModel(false));
});

class MyTheme extends StateNotifier<ThemeModel> {
  MyTheme(state) : super(state);

  SetDark() {
    state = ThemeModel(true);
  }

  SetLight() {
    state = ThemeModel(false);
  }
}
