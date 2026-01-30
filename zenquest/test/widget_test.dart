import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/app_state.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => AppState(),
        child: ZenQuestApp(),
      ),
    );

    // Verify that we start on the login screen
    expect(find.text('ZenQuest'), findsOneWidget);
    expect(find.text('Start Your Quest'), findsOneWidget);
  });
}
