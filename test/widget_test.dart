import 'package:flutter_test/flutter_test.dart';
import 'package:valur_game_service_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ValurGameService());
  });
}