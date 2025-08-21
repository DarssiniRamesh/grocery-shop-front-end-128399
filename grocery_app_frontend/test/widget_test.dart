import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app_frontend/main.dart';

void main() {
  testWidgets('Home renders greeting and Recommended section', (WidgetTester tester) async {
    await tester.pumpWidget(const GroceryApp());

    expect(find.text('Hey, Halal'), findsOneWidget);
    expect(find.text('Recommended'), findsOneWidget);
  });
}
