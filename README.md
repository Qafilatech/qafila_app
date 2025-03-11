# QafilaTech Customer Application

<p align="center">
  <img src="assets/images/QAFILATECH.png" alt="QafilaTech Logo" width="200"/>
</p>

QafilaTech is a sophisticated Flutter-based mobile application that provides seamless transportation and delivery services. The application offers a dual-language interface (English and Arabic) and integrates advanced features for ride-hailing and delivery management.

## Table of Contents

- [Features](#features)
- [Technical Architecture](#technical-architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Development](#development)
- [Testing](#testing)
- [Deployment](#deployment)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

## Features

### Core Functionality
- **User Authentication**
  - Multi-platform sign-in (Email, Google, Apple)
  - Secure authentication flow
  - Profile management system

- **Transportation Services**
  - Real-time ride tracking
  - Dynamic route optimization
  - Fare estimation
  - Driver-passenger matching

- **Delivery Management**
  - Order tracking system
  - Real-time delivery status
  - Multi-point delivery support
  - Delivery history

- **Location Services**
  - Real-time GPS tracking
  - Intelligent route planning
  - Geofencing capabilities
  - Location history

### User Interface
- **Multilingual Support**
  - English and Arabic interfaces
  - RTL/LTR layout support
  - Dynamic language switching

- **Theme Customization**
  - Light/Dark mode support
  - Dynamic theme switching
  - Custom theme configuration

- **Navigation**
  - Intuitive bottom navigation
  - Gesture-based interactions
  - Seamless screen transitions

## Technical Architecture

### Technology Stack
- **Frontend Framework**: Flutter (Stable Channel)
- **State Management**: Provider
- **Backend Services**: Firebase
- **Database**: Cloud Firestore
- **Authentication**: Firebase Auth
- **Storage**: Firebase Storage
- **Maps Integration**: Google Maps
- **Location Services**: Geolocator
- **API Integration**: RESTful APIs

### Dependencies
```yaml
Key Dependencies:
- firebase_core: ^3.8.0
- cloud_firestore: ^5.5.0
- firebase_auth: ^5.3.3
- google_maps_flutter: ^2.9.0
- provider: ^6.1.2
- geolocator: ^13.0.1
- flutter_localizations
```

## Prerequisites

- Flutter SDK (Latest Stable Version)
- Dart SDK (>=3.0.0 <4.0.0)
- Android Studio / VS Code
- Firebase Account
- Google Maps API Key
- iOS Developer Account (for iOS deployment)

## Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd qafila_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Add `google-services.json` to `/android/app`
   - Add `GoogleService-Info.plist` to `/ios/Runner`

4. Configure Google Maps:
   - Add API key to Android Manifest
   - Add API key to iOS AppDelegate

5. Run the application:
```bash
flutter run
```

## Project Structure

```
qafila_app/
├── android/                 # Android-specific configurations
├── ios/                    # iOS-specific configurations
├── lib/
│   ├── account_profile_creation/  # Profile management
│   ├── auth/               # Authentication logic
│   ├── backend/           # Backend service integrations
│   ├── components/        # Reusable UI components
│   ├── custom_code/       # Custom implementations
│   ├── flutter_flow/      # FlutterFlow configurations
│   ├── pages/             # Application screens
│   └── main.dart          # Application entry point
├── assets/                # Application resources
├── test/                 # Test files
└── pubspec.yaml          # Project configuration
```

## Configuration

### Environment Variables
Create a `.env` file in the project root:
```
GOOGLE_MAPS_API_KEY=your_api_key
FIREBASE_API_KEY=your_firebase_key
```

### Firebase Setup
1. Create a Firebase project
2. Enable Authentication methods
3. Configure Firestore rules
4. Set up Storage rules

### Google Maps Configuration
1. Obtain API key from Google Cloud Console
2. Enable required APIs:
   - Maps SDK for Android/iOS
   - Places API
   - Directions API

## Development

### Code Style
- Follow Flutter's official style guide
- Use meaningful variable and function names
- Comment complex logic
- Maintain consistent file structure

### State Management
- Use Provider for app-wide state
- Implement local state where appropriate
- Follow unidirectional data flow

### Error Handling
- Implement proper error boundaries
- Use try-catch blocks
- Display user-friendly error messages

## Testing

### Unit Tests
```bash
flutter test test/unit/
```

### Integration Tests
```bash
flutter test integration_test/
```

### Widget Tests
```bash
flutter test test/widget/
```

## Deployment

### Android
1. Update version in `pubspec.yaml`
2. Create release build:
```bash
flutter build apk --release
```

### iOS
1. Update version in `pubspec.yaml`
2. Create release build:
```bash
flutter build ios --release
```

## Security

- Implement secure authentication flows
- Use Firebase Security Rules
- Encrypt sensitive data
- Implement proper session management
- Regular security audits

## Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## License

This project is proprietary software. All rights reserved.

## Support

For support, email [support@qafilatech.com](mailto:support@qafilatech.com)

---

Developed with ❤️ by QafilaTech Team
