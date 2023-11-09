import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

final ClickModelProvider = ChangeNotifierProvider(
  create: (context) => ClickModel(),
);

class ClickModel with ChangeNotifier {
  var numClick = 0;
  String err = "";
  void Click(int multiplier) {
    numClick += multiplier * multiplier;
    notifyListeners();
  }
}

final LevelModelProvider = ChangeNotifierProvider(
  create: (context) => LevelModel(),
);

class LevelModel with ChangeNotifier {
  var level = 1;
  var errText = "";
  final maxLevel = 10;
  void upLevel() {
    if (level <= maxLevel) {
      level++;
      notifyListeners();
      return;
    }
    errText = "Вы достигли максимального уровня";
    notifyListeners();
  }
}
