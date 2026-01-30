import 'package:flutter_test/flutter_test.dart';
import 'package:app/providers/app_state.dart';

void main() {
  group('AppState Tests', () {
    test('Initial values are correct', () {
      final state = AppState();
      expect(state.xp, 120);
      expect(state.coins, 45);
      expect(state.diamonds, 10);
      expect(state.streak, 5);
    });

    test('Completing lesson awards rewards', () {
      final state = AppState();
      state.completeLesson('lesson_1', 50, 10);
      expect(state.xp, 170);
      expect(state.coins, 55);
      expect(state.isLessonCompleted('lesson_1'), true);
    });

    test('XP progress and level logic', () {
      final state = AppState();
      // Level 2 (120 XP)
      expect(state.level, 2);
      expect(state.xpProgress, 0.2);

      state.addXp(80);
      // Level 3 (200 XP)
      expect(state.level, 3);
      expect(state.xpProgress, 0.0);
    });
  });
}
