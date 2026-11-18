import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:one_love_radio/features/radio/radio_player_controller.dart';

class RadioPlayerPage extends StatefulWidget {
  const RadioPlayerPage({super.key, required this.title});

  final String title;

  @override
  State<RadioPlayerPage> createState() => _RadioPlayerPageState();
}

class _RadioPlayerPageState extends State<RadioPlayerPage> {
  final RadioPlayerController _controller = RadioPlayerController();

  @override
  Widget build(BuildContext context) {
    // Rebuild when the player changes, including after notification actions.
    return StreamBuilder<bool>(
      stream: _controller.playingStream,
      initialData: _controller.isPlaying,
      builder: (context, snapshot) {
        final isPlaying = snapshot.data ?? false;

        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  '24-7 Reggae',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                const Text('by Joint Radio Reggae'),
                const SizedBox(height: 12),
                if (isPlaying)
                  Text(
                    'Now playing',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                StreamBuilder<String?>(
                  stream: _controller.trackTitleStream,
                  builder: (context, snapshot) {
                    // Use a neutral label when ICY metadata is absent or unsupported.
                    final trackTitle = snapshot.data;

                    return Text(
                      trackTitle ?? 'Live reggae radio',
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  },
                ),
                Text(
                  isPlaying ? 'LIVE' : 'PAUSED',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _controller.togglePlayback,
            tooltip: isPlaying ? 'pause' : 'play',
            foregroundColor: Color(0xFFD2AA63),
            child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    unawaited(_controller.dispose());
    super.dispose();
  }
}
