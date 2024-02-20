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
flutter run -d chrome --web-port 5000 --dart-define-from-file=lib/config/dev/web_config.json
flutter run -d macos --dart-define-from-file=lib/config/dev/mac_config.json
flutter run -d 2F756D02-877E-4B39-A890-1EB90D5EEC7D --dart-define-from-file=lib/config/dev/ios_config.json (device id of iphone)

flutter run -d emulator-5554 --dart-define-from-file=lib/config/dev/android_config.json (device id of android)


Firebase project
https://console.firebase.google.com/project/flutter-app-ab2c9/overview

GCP
(Web)
https://console.cloud.google.com/apis/credentials/oauthclient/1059213750252-gn2hqk8iliel04r01bael2tbkh0514bn.apps.googleusercontent.com?authuser=0&hl=en&project=flutter-app-ab2c9

(Android)
https://console.cloud.google.com/apis/credentials/key/c4100b73-de1e-4e62-b861-75f930981909?authuser=0&hl=en&project=flutter-app-ab2c9

npm install -g firebase-tools
firebase login
flutter pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
flutterfire configure

flutter pub add firebase_core
flutter pub add firebase_auth

Environment variables are defined in
config/*
For web, get OAuth client id from
https://console.cloud.google.com/apis/credentials/oauthclient/1059213750252-gn2hqk8iliel04r01bael2tbkh0514bn.apps.googleusercontent.com?authuser=0&hl=en&project=flutter-app-ab2c9

For android
https://console.cloud.google.com/apis/credentials/oauthclient/1059213750252-1fil0t2687n8qh29i8onis17r550beue.apps.googleusercontent.com?authuser=0&hl=en&project=flutter-app-ab2c9


For google provider service sign in
Client id of android and web are the same

Building apps
Nested Nav: 
https://pub.dev/packages/go_router
https://docs.flutter.dev/cookbook/effects/nested-nav
https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart

Provider:
https://pub.dev/packages/provider/install
flutter pub add provider

Google sign in
https://pub.dev/packages/google_sign_in/install
flutter pub add google_sign_in

Add key fingerprint for android
https://developers.google.com/android/guides/client-auth

Enable api
https://console.developers.google.com/apis/api/people.googleapis.com/overview?project=1059213750252


App Icon
https://pub.dev/packages/flutter_launcher_icons