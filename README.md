# QafilaTech-Cust

Flutter SDK will be needed prior to running

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.


### Key Directories and Files

- **android/**: Contains the Android-specific files and configurations.
- **assets/**: Contains various assets like images, fonts, audios, videos, etc.
- **firebase/**: Contains Firebase configuration files and rules.
- **ios/**: Contains the iOS-specific files and configurations.
- **lib/**: Contains the Dart source code for the application.
- **pubspec.yaml**: The Dart package configuration file.
- **README.md**: This file.

## Firebase Configuration

The Firebase configuration is located in the `firebase/` directory. Key files include:

- `firebase.json`: Firebase configuration file.
- `firestore.rules`: Firestore security rules.
- `firestore.indexes.json`: Firestore indexes configuration.
- `storage.rules`: Firebase Storage security rules.

## Assets

Assets are organized into subdirectories under `assets/`:

- `assets/audios/`: Audio files.
- `assets/fonts/`: Font files.
- `assets/images/`: Image files.
- `assets/jsons/`: JSON files.
- `assets/pdfs/`: PDF files.
- `assets/rive_animations/`: Rive animation files.
- `assets/videos/`: Video files.

## Adding Assets

To add assets to your application, update the `pubspec.yaml` file. For example:

```yaml
flutter:
  assets:
    - assets/fonts/
    - assets/images/
    - assets/videos/
    - assets/audios/
    - assets/rive_animations/
    - assets/pdfs/
    - assets/jsons/

## Custom Fonts
Adding custom fonts will have to be updated in pubspec.yaml

flutter:
  fonts:
    - family: Schyler
      fonts:
        - asset: fonts/Schyler-Regular.ttf
        - asset: fonts/Schyler-Italic.ttf
          style: italic
    - family: Trajan Pro
      fonts:
        - asset: fonts/TrajanPro.ttf
        - asset: fonts/TrajanPro_Bold.ttf
          weight: 700

## Android Configuration
    The Android configuration is located in the android directory. Key files include:

    - build.gradle: The main build configuration file for the Android project.

## iOS Configuration
    The iOS configuration is located in the ios directory. Key files include:

    - Runner.xcworkspace: The Xcode workspace for the iOS project.
    -Podfile: The CocoaPods configuration file.
## Firestore Utilities
    Firestore utilities are located in the firestore_util.dart file. This includes utility classes and functions for working with Firestore.

## Building the Project 
    - For Android:
        flutter build apk

    -For iOS:
        flutter build ios

## Running the project

    Run the following command to run/debug:
        flutter run

    to clean the project:
        flutter clean

## Developed by Tariq Y. (The Moist Marauder)