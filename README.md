# One Love Radio

> **Work in progress** — a simple radio app for listening to 24-7 Reggae.

One Love Radio is a personal project born from my love of reggae and my habit of listening to **24-7 Reggae** several times a day. It’s my first project with Flutter and Dart: a simple, dedicated player for the station.

## Planned features

- Play and pause the live broadcast.
- Show whether playback is live or paused.
- Display the current artist and track when the stream provides metadata.
- Continue playback in the background.
- Support media controls in Android notifications and system media controls.

The app will remain focused on this station; multiple stations, podcasts, schedules, and news are out of scope for the moment.

## Stream

The app uses the station's direct stream URL:

<https://antares.dribbcast.com/proxy/s8200/stream>

The app will display track metadata when the stream provides it. Metadata may not be available for every update, so the app should handle that gracefully.

## Tech stack

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

The app is intended for Android, iOS, Linux, and Windows. Android is the initial development target. Building and running the iOS app requires macOS and Xcode. Linux desktop builds require the Flutter Linux toolchain; Windows desktop builds require Windows with the Flutter Windows toolchain.

## Getting started

Requires the Flutter SDK. To check your setup, run:

```bash
flutter doctor -v
```

### Run the app

From the project root:

```bash
flutter pub get
flutter run
```

Choose an available device when prompted. Run `flutter devices` to list them.

## Project status

The project is at the initial setup stage; the radio player is not implemented yet.
