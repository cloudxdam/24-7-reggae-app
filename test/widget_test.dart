import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reggae_24_7/app.dart';
import 'package:reggae_24_7/features/radio/radio_player_controller.dart';
import 'package:reggae_24_7/features/radio/radio_player_page.dart';

class _FailingController extends RadioPlayerController {
  @override
  String? get currentError => 'Stream unavailable';

  @override
  Stream<String?> get errorStream => const Stream.empty();
}

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

  testWidgets('shows the offline state when the stream fails', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: RadioPlayerPage(controller: _FailingController())),
    );

    expect(find.text('OFFLINE'), findsOneWidget);
    expect(find.text('Stream unavailable'), findsOneWidget);
  });
}
