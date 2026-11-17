# One Love Radio

> **Work in progress** — a simple radio app for listening to Joint Radio Reggae.

One Love Radio is a personal project born from my love of reggae and my habit of listening to online radio throughout the day. It’s my first project with Flutter and Dart: a dedicated player for **Joint Radio Reggae**.

## Planned features

- Play and pause the live broadcast.
- Show whether playback is live or paused.
- Continue playback in the background.
- Support media controls in notifications and system media controls.

For now, the app is focused on this station; multiple stations, podcasts, schedules, and news are out of scope.

## Stream

The app uses Joint Radio’s official integration URL:

<https://jointil.com/stream-reggae>

The URL is listed in the [official Joint Radio streams repository](https://github.com/JointRadio/joint-radio-streams), which permits using its streams in apps. Its stated condition is to display the station’s full name, **Joint Radio Reggae**, wherever the stream is played.

## Tech stack

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

The app is intended for Android, iOS, Linux, and Windows. Android is the initial development target. Building and running the iOS app requires macOS and Xcode. Linux desktop builds require the Flutter Linux toolchain; Windows desktop builds require Windows with the Flutter Windows toolchain.

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

The project is at the initial setup stage; the radio player is not implemented yet.
