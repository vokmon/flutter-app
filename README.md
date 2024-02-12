# flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Command line
https://docs.flutter.dev/reference/flutter-cli

flutter create project_name

flutter emulators
flutter emulators --launch Pixel_XL_API_34
flutter emulators --launch apple_ios_simulator

flutter devices
flutter run
flutter run -d chrome
flutter run -d macos
flutter run -d 2F756D02-877E-4B39-A890-1EB90D5EEC7D (device id of iphone)


Firebase project
https://console.firebase.google.com/project/flutter-app-ab2c9/overview
npm install -g firebase-tools
firebase login
flutter pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
flutterfire configure

flutter pub add firebase_core
flutter pub add firebase_auth

Building apps
Nested Nav: 
https://pub.dev/packages/go_router
https://docs.flutter.dev/cookbook/effects/nested-nav
https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart

Provider:
https://pub.dev/packages/provider/install
flutter pub add provider