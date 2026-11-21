# 24-7 Reggae

> **Work in progress** — a simple radio app for listening to Joint Radio Reggae.

24-7 Reggae is a personal project born from my love of reggae and my habit of listening to online radio throughout the day. It’s my first project with Flutter and Dart: a dedicated player for **Joint Radio Reggae**.

## Features

- Play and pause the Joint Radio Reggae live stream.
- Show whether playback is live or paused.
- Continue playback in the background and support Android media notification controls.
- Display track metadata from the stream’s ICY metadata when available.

## Platform notes

- Android: Playback, pause/resume, background audio, notification controls, and ICY metadata have been tested.
- Linux and Windows: Not set up yet. `just_audio` needs an extra backend package on these platforms (`media_kit_libs_linux` or `just_audio_windows`) which is not listed in `pubspec.yaml`.

For now, the app is focused on this station; multiple stations, podcasts, schedules, and news are out of scope.

## Stream

The app uses Joint Radio’s official integration URL:

<https://jointil.com/stream-reggae>

The URL is listed in the [official Joint Radio streams repository](https://github.com/JointRadio/joint-radio-streams), which permits using its streams in apps. Its stated condition is to display the station’s full name, **Joint Radio Reggae**, wherever the stream is played.

## Tech stack

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [`just_audio`](https://pub.dev/packages/just_audio) — stream playback and ICY metadata
- [`just_audio_background`](https://pub.dev/packages/just_audio_background) — background playback and the media notification

Android is the development platform. Linux and Windows desktop builds also need the audio backend packages listed above.

## Getting started

Requires the Flutter SDK. Check your setup with:

```bash
flutter doctor -v
```

From the project root, fetch dependencies and run the app:

```bash
flutter pub get
flutter run
```

Choose an available device when prompted. Run `flutter devices` to list them.

## Project status

The radio player is implemented and verified on Android. Linux and Windows support is pending the audio backend packages.
