import 'package:flutter_test/flutter_test.dart';
import 'package:kotoba_e/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const KotobaEApp());

    // Verify that the welcome screen is displayed
    expect(find.text('ことばえ'), findsOneWidget);
    expect(find.text('イラスト国語辞典'), findsOneWidget);
  });
}
