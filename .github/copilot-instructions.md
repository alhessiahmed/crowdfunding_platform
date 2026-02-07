# Copilot / AI Agent Instructions for crowdfunding_platform

Purpose: Help AI coding agents be productive on this Flutter app by describing the architecture, key files, dev workflows, and repo-specific conventions.

- Quick context: This is a Flutter app skeleton using GetX-style organization. Key surface files: `lib/main.dart`, `pubspec.yaml`, and platform folders (`android/`, `ios/`, `windows/`).

Big picture
- App type: Flutter mobile/desktop/web app. Entry point is `lib/main.dart`.
- Logical layers:
  - `lib/controller/` — controllers, API clients, persistence. Subfolders: `api/`, `core/`, `database/`, `getx/`, `localization/`, `shared_pref/` (these are the intended places to add logic).
  - `lib/model/` — data models (currently empty; add POJO/DTO classes here).
  - `lib/view/` — UI layer; split into `screens/` and `widgets/`.
- State & routing: Project includes `get` in `pubspec.yaml` and a `getx` folder — prefer GetX patterns for controllers and navigation when adding features.

Data & service boundaries
- Network: `http` package is declared in `pubspec.yaml`. Place network code under `lib/controller/api/` and expose a small client wrapper for error handling and retries.
- Local persistence: `shared_preferences` is listed; use `lib/controller/shared_pref/` for preference helpers.
- Models: Keep plain model classes in `lib/model/`, with fromJson/toJson when interacting with APIs.

Project-specific conventions (discoverable from repo)
- Folder-first organization: Prefer adding new features by creating parallel files under the existing folders (`controller/*`, `model/`, `view/screens/*`, `view/widgets/*`) rather than large monolithic files.
- GetX-style controllers: Put controller classes in `lib/controller/getx/` and name them `FooController` with matching `foo_controller.dart` filename.
- UI widgets: Small, reusable widgets belong in `lib/view/widgets/`; screens go under `lib/view/screens/` and should be thin, delegating logic to controllers.
- Formatting & analysis: `flutter_lints` is enabled in `pubspec.yaml` and `analysis_options.yaml` exists — follow the lints and run `dart analyze` / `flutter analyze`.

Build, run & test (commands)
- Fetch deps: `flutter pub get`
- Analyze: `flutter analyze`
- Run (select device):
  - Default device or connected phone: `flutter run`
  - Windows desktop (if using Windows): `flutter run -d windows`
  - Android (from repo root): `flutter run -d <deviceId>` or use Android Studio emulator
- Build artifacts:
  - Android APK: `flutter build apk` (or from `android\` run `.\gradlew assembleDebug` on Windows)
  - iOS: `flutter build ios` (requires macOS)
- Tests: `flutter test` (there is `test/widget_test.dart`)
- Formatting: `flutter format .`

Editing & dependency rules
- When adding a dependency: update `pubspec.yaml`, then run `flutter pub get`. Keep dependency additions minimal and prefer existing packages (`get`, `http`, `flutter_screenutil`, `flutter_svg`, `shared_preferences`).
- SDK constraint: Dart SDK set to `^3.8.1` in `pubspec.yaml`; ensure any added packages are null-safety compatible.

Platform integration notes
- Android: Gradle wrappers present (`android/gradlew.bat`) — build on Windows with `.\gradlew` commands in `android` folder.
- iOS/macOS: Standard Xcode projects in `ios/` and `macos/` folders. Only run builds on macOS machines.
- Web: `web/` exists; use `flutter run -d chrome` or `flutter build web`.

Code-change guidance for AI agents
- Small, focused PRs: change one logical area (e.g., add controller + model + screen) rather than monolithic rewrites.
- File placement examples:
  - API client: `lib/controller/api/api_client.dart`
  - GetX controller: `lib/controller/getx/auth_controller.dart`
  - Model: `lib/model/user.dart`
  - Screen: `lib/view/screens/login_screen.dart`
  - Widget: `lib/view/widgets/rounded_button.dart`
- Tests: Add unit/widget tests under `test/` alongside new features.
- Lint & format: Run `flutter analyze` and `flutter format .` before finalizing changes.

What not to assume
- The repo is scaffold-level; many controller subfolders are empty. Do not assume existing helper utilities; create new helpers under `lib/controller/core/` or `lib/controller/api/` as needed.
- Do not modify platform project files (`android/`, `ios/`) unless a change is necessary for the feature (and flag these in the PR).

Where to look for examples
- `lib/main.dart` — app entry, basic MaterialApp setup.
- `pubspec.yaml` — declared dependencies and lints.
- Platform folders (`android/`, `ios/`, `windows/`) — platform-specific entry points and build configs.

If unsure, ask the repo owner for:
- Preferred routing pattern (GetX vs. Navigator 2.0) if adding global navigation features.
- Any existing API contracts or backend base URLs (APIs folder is empty so remote endpoints are not discoverable here).

End: After making changes, run `flutter analyze`, `flutter test`, and `flutter format .` and include those results in the PR description.

Please review this file for accuracy and tell me if you want it expanded with examples or stricter conventions (naming rules, architectural diagrams, CI steps).