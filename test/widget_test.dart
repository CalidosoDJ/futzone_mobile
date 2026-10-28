import 'package:flutter_test/flutter_test.dart';
import 'package:futzone_mobile/main.dart';

void main() {
  testWidgets('Carga inicial de FutZoneApp', (WidgetTester tester) async {
    // Construye nuestra app e inicia el frame
    await tester.pumpWidget(const FutZoneApp());
  });
}
