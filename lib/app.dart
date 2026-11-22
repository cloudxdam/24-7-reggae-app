import 'package:material_ui/material_ui.dart';
import 'package:one_love_radio/features/radio/radio_player_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '24-7 Reggae',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Color(0xFF718C78),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF172B20),
      ),
      home: const RadioPlayerPage(),
    );
  }
}
