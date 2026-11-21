import 'package:flutter/widgets.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:one_love_radio/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the media service before runApp builds the UI.
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.oneloveradio.one_love_radio.audio',
    androidNotificationChannelName: '24-7 Reggae',
    androidNotificationOngoing: true,
  );

  runApp(const MyApp());
}