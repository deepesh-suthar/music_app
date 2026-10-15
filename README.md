# Jamendo Music Player

A small Flutter assessment app that browses and searches real music from the
Jamendo API and plays Jamendo audio streams. It includes infinite scrolling, a
mini player, and a responsive Now Playing screen.

## Structure

The code follows a lightweight DDD layout:

- `lib/domain`: track entities, repository contract, and app constants.
- `lib/infrastructure`: Jamendo HTTP repository and response mapping.
- `lib/application`: catalog/search pagination and audio player Cubits.
- `lib/presentation`: dark theme, home screen, mini player, and Now Playing UI.

Provider owns app-level dependencies (`MusicRepository` and `AudioPlayer`).
`MusicCatalogCubit` owns listing, debounced search, errors, and pagination.
`PlayerCubit` owns the active queue and real playback state.

## Jamendo API

The app calls `https://api.jamendo.com/v3.0/tracks/` with `limit=20`, an
incrementing `offset`, and `namesearch` for searches. The client ID is supplied
at compile time and is not committed to source control.

## Setup and run

```bash
cp .env.example.json .env.json
# Replace the placeholder in .env.json with your Jamendo client ID.
fvm flutter pub get
fvm flutter run --flavor production --dart-define-from-file=.env.json
```

The VS Code `Production` launch configuration loads `.env.json` automatically.

If you do not use FVM, replace `fvm flutter` with `flutter`.

## Tests

```bash
fvm flutter test
```

Tests cover Jamendo mapping, request parameters, repository errors,
pagination, de-duplication, and search reset behavior.

## Release APK

This project contains `dev` and `production` Android flavors:

```bash
fvm flutter build apk --release --flavor production \
  --dart-define-from-file=.env.json
```

The standard Flutter command requested by the assignment is:

```bash
flutter build apk --release
```
