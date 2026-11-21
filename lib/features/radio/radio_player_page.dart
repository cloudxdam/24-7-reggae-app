import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:one_love_radio/features/radio/radio_player_controller.dart';

class RadioPlayerPage extends StatefulWidget {
  const RadioPlayerPage({super.key});

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
        const goldColor = Color(0xFFD2AA63);

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    '24-7 Reggae',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: goldColor,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFD92B2B),
                          Color(0xFFF5C518),
                          Color(0xFF00873E),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          blurRadius: 6,
                          spreadRadius: 8,
                          offset: Offset.zero,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: _controller.togglePlayback,
                      tooltip: isPlaying ? 'pause' : 'play',
                      iconSize: 100,
                      padding: const EdgeInsets.all(16),
                      color: Colors.black,
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 80,
                    child: Badge(
                      backgroundColor: isPlaying
                          ? const Color(0xFFDA121A)
                          : Theme.of(context).colorScheme.secondaryContainer,
                      textColor: isPlaying
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSecondaryContainer,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      label: Text(isPlaying ? 'LIVE' : 'PAUSED'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  StreamBuilder<String?>(
                    stream: _controller.trackTitleStream,
                    builder: (context, snapshot) {
                      // The station sends ICY track titles; fall back to a state label while
                      // they load or when the platform does not parse them.
                      final trackTitle = snapshot.data;
                      final String displayText;
                      if (!isPlaying) {
                        displayText = 'Live reggae radio';
                      } else if (trackTitle != null) {
                        displayText = trackTitle;
                      } else {
                        displayText = 'Now playing';
                      }
                      return Text(
                        displayText,
                        style: Theme.of(context).textTheme.bodyLarge
                            ?.copyWith(color: goldColor, fontSize: 32),
                      );
                    },
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'by Joint Radio Reggae',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
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
