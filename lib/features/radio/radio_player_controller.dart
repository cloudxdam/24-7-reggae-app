import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

/// Controls playback of the station's live stream.
///
/// Created and disposed by the page that displays it.
class RadioPlayerController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  // Tag the live source so system media controls identify the station.
  final AudioSource _radioSource = AudioSource.uri(
    Uri.parse('https://jointil.com/stream-reggae'),
    tag: MediaItem(
      id: 'joint-radio-reggae',
      title: 'Joint Radio Reggae',
      isLive: true,
    ),
  );

  static const _offlineMessage = 'Stream unavailable';
  String? _lastError;
  final StreamController<String?> _errorController =
      StreamController<String?>.broadcast();
  StreamSubscription<PlayerException>? _errorSubscription;

  RadioPlayerController() {
    _errorSubscription = _audioPlayer.errorStream.listen(
      (_) => _setError(_offlineMessage),
    );
  }

  bool get isPlaying => _audioPlayer.playing;

  Stream<bool> get playingStream => _audioPlayer.playingStream;

  // Expose a title string without exposing the plugin ICY type to the page.
  Stream<String?> get trackTitleStream =>
      _audioPlayer.icyMetadataStream.map((metadata) => metadata?.info?.title);

  String? get currentError => _lastError;
  Stream<String?> get errorStream => _errorController.stream;

  void _setError(String? message) {
    if (_lastError == message) return;
    _lastError = message;
    _errorController.add(message);
  }

  Future<void> togglePlayback() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
      return;
    }

    _setError(null);

    try {
      if (_audioPlayer.audioSource == null) {
        await _audioPlayer.setAudioSource(_radioSource);
      }

      // Do not await: a live stream Future completes when playback stops or pauses.
      _audioPlayer.play();
    } on PlayerException {
      _setError(_offlineMessage);
    }
  }

  Future<void> dispose() async {
    await _errorSubscription?.cancel();
    await _errorController.close();
    await _audioPlayer.dispose();
  }
}
