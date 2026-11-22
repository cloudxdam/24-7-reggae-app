import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:reggae_24_7/app.dart';

void main() {
  testWidgets('shows the station paused on launch', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('24-7 Reggae'), findsOneWidget);
    expect(find.text('by Joint Radio Reggae'), findsOneWidget);
    expect(find.text('PAUSED'), findsOneWidget);
    expect(find.text('Live reggae radio'), findsOneWidget);
    expect(find.text('Now playing'), findsNothing);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsNothing);
  });
}
