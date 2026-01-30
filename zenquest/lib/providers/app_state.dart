import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int _xp = 120; // Starting with some XP for visual effect in dashboard
  int _coins = 45;
  int _diamonds = 10;
  int _streak = 5;
  Set<String> _completedLessons = {};

  int get xp => _xp;
  int get coins => _coins;
  int get diamonds => _diamonds;
  int get streak => _streak;

  double get xpProgress => (_xp % 100) / 100.0;
  int get level => (_xp / 100).floor() + 1;

  bool isLessonCompleted(String lessonId) => _completedLessons.contains(lessonId);

  void completeLesson(String lessonId, int xpReward, int coinsReward) {
    if (!_completedLessons.contains(lessonId)) {
      _completedLessons.add(lessonId);
      _xp += xpReward;
      _coins += coinsReward;
      notifyListeners();
    }
  }

  void addXp(int amount) {
    _xp += amount;
    notifyListeners();
  }

  void addCoins(int amount) {
    _coins += amount;
    notifyListeners();
  }
}
