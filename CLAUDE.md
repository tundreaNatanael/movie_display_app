# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A Flutter movie database app that displays popular movies from TMDB API with offline fallback data. Features a grid-based home screen and detailed movie view.

## Common Commands

```bash
# Install dependencies
flutter pub get

# Run the app (requires connected device/emulator)
flutter run

# Analyze code for issues
flutter analyze

# Run tests
flutter test

# Build for specific platform
flutter build apk         # Android
flutter build ios         # iOS
flutter build web         # Web
```

## Architecture

### Navigation Flow
- `main.dart` → `HomeScreen` (entry point)
- `HomeScreen` → `DetailScreen` via `Navigator.push`

### Data Flow
1. `HomeScreen` fetches from TMDB API on initialization
2. On API failure/timeout (10s), falls back to `Movie.getHardcodedMovies()`
3. Movie data passed to `DetailScreen` via Navigator parameters

### Widget Structure
- **StatefulWidget**: `HomeScreen` (manages API state, loading, error messages)
- **StatelessWidget**: `MovieCard`, `DetailScreen`, `MovieApp`

### Key Patterns
- API key is hardcoded in `screens/home_screen.dart:20` (public demo key)
- Movie model includes `fromJson` factory + hardcoded fallback data
- Image URLs constructed via `fullPosterPath`/`fullBackdropPath` getters
- Uses `.withValues(alpha:)` instead of deprecated `.withOpacity()`

### File Organization
```
lib/
├── main.dart                    # App entry + theme
├── models/movie.dart            # Data model + hardcoded movies
├── screens/
│   ├── home_screen.dart         # StatefulWidget with GridView
│   └── detail_screen.dart       # StatelessWidget with scrollable details
└── widgets/
    └── movie_card.dart          # Reusable card component
```

## API Integration

TMDB API endpoint: `https://api.themoviedb.org/3/movie/popular`
Images: `https://image.tmdb.org/t/p/{w500|w780}/{path}`

API errors automatically trigger hardcoded data fallback with user notification banner.
