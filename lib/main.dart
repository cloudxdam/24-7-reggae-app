import 'package:flutter/widgets.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:reggae_24_7/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the media service before runApp builds the UI.
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.dpdev.reggae247.audio',
    androidNotificationChannelName: '24-7 Reggae',
    androidNotificationOngoing: true,
  );

  runApp(const MyApp());
}
