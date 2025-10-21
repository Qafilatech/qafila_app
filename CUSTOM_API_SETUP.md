# Custom API Setup Guide

## 🎉 Firebase Removed Successfully!

Your Qafila app has been migrated from Firebase to use custom APIs. Here's everything you need to know.

## 📁 What Changed

### Removed:
- ❌ All Firebase dependencies (Firebase Auth, Firestore, Storage, Performance)
- ❌ All Supabase dependencies
- ❌ Firebase configuration files (`google-services.json`, `GoogleService-Info.plist`)
- ❌ Firebase initialization code

### Added:
- ✅ Custom API service layer (`lib/backend/api_service.dart`)
- ✅ Custom authentication service (`lib/backend/auth_service.dart`)
- ✅ Custom auth user provider (`lib/auth/custom_auth/`)

## 🚀 How to Use

### 1. Configure Your API Base URL

Open `lib/backend/api_service.dart` and update the base URL:

```dart
// TODO: Replace with your actual API base URL
static const String baseUrl = 'https://your-api-url.com/api';
```

### 2. API Endpoints Expected

Your backend should implement these endpoints:

#### Authentication Endpoints

**Login (POST)**
```
POST /auth/login
Body: {
  "email": "user@example.com",
  "password": "password123"
}
Response: {
  "token": "jwt_token_here",
  "user": {
    "id": "user_id",
    "email": "user@example.com",
    "displayName": "User Name",
    "phoneNumber": "+1234567890",
    "photoUrl": "https://...",
    ...other_fields
  }
}
```

**Register (POST)**
```
POST /auth/register
Body: {
  "email": "user@example.com",
  "password": "password123",
  ...additional_data
}
Response: {
  "token": "jwt_token_here",
  "user": { ...user_object }
}
```

**Phone Auth - Send OTP (POST)**
```
POST /auth/phone/send-otp
Body: {
  "phone": "+1234567890"
}
Response: {
  "success": true,
  "message": "OTP sent"
}
```

**Phone Auth - Verify OTP (POST)**
```
POST /auth/phone/verify
Body: {
  "phone": "+1234567890",
  "otp": "123456"
}
Response: {
  "token": "jwt_token_here",
  "user": { ...user_object }
}
```

**Update Profile (PUT)**
```
PUT /auth/profile
Headers: {
  "Authorization": "Bearer jwt_token_here"
}
Body: {
  "displayName": "New Name",
  "phoneNumber": "+9876543210",
  ...fields_to_update
}
Response: {
  "user": { ...updated_user_object }
}
```

### 3. Using the Authentication Service

#### Sign In with Email
```dart
import '/backend/auth_service.dart';

final result = await authManager_signInWithEmail(
  'user@example.com',
  'password123',
);

if (result.success) {
  print('Logged in: ${result.user?.displayName}');
} else {
  print('Error: ${result.error}');
}
```

#### Sign Up
```dart
final result = await authManager_createAccountWithEmail(
  'newuser@example.com',
  'password123',
);

if (result.success) {
  print('Account created!');
}
```

#### Sign In with Phone
```dart
// First, send OTP
bool sent = await authManager_sendOTP('+1234567890');

if (sent) {
  // Then verify with the OTP the user received
  final result = await authManager_signInWithPhone(
    '+1234567890',
    '123456', // OTP code
  );
  
  if (result.success) {
    print('Logged in with phone!');
  }
}
```

#### Sign Out
```dart
await authManager_signOut();
```

#### Get Current User
```dart
final user = currentAuthUser;

if (user != null && user.loggedIn) {
  print('User: ${user.displayName}');
  print('Email: ${user.email}');
  print('Phone: ${user.phoneNumber}');
}
```

#### Update Profile
```dart
final result = await authManager_updateProfile({
  'displayName': 'New Name',
  'phoneNumber': '+9876543210',
});

if (result.success) {
  print('Profile updated!');
}
```

### 4. Making Custom API Calls

Use the `ApiService` class for any custom API calls:

```dart
import '/backend/api_service.dart';

// GET request
final response = await ApiService.get('/users/profile');
if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  // Use the data
}

// POST request
final response = await ApiService.post('/orders', {
  'items': [...],
  'address': '...',
});

// PUT request
final response = await ApiService.put('/orders/123', {
  'status': 'delivered',
});

// DELETE request
final response = await ApiService.delete('/orders/123');

// PATCH request
final response = await ApiService.patch('/users/settings', {
  'notifications': true,
});
```

All requests automatically include the authentication token in the `Authorization` header.

### 5. Token Management

The auth token is automatically:
- Saved when user logs in
- Included in all API requests
- Removed when user logs out

You can also manually manage tokens:

```dart
// Get current token
String? token = await ApiService.getAuthToken();

// Set token
await ApiService.setAuthToken('new_token');

// Clear token
await ApiService.clearAuthToken();
```

## 🔧 Customization

### Adding More Auth Methods

You can add more authentication methods in `lib/backend/auth_service.dart`:

```dart
// Example: Social login
static Future<AuthResult> signInWithGoogle() async {
  try {
    final response = await ApiService.post('/auth/google', {
      // Google auth data
    });
    // Handle response...
  } catch (e) {
    return AuthResult(success: false, error: e.toString());
  }
}
```

### Customizing User Model

Edit the `CustomUser` class in `lib/backend/auth_service.dart` to match your API's user structure:

```dart
class CustomUser {
  final String id;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final String? photoUrl;
  final String? role; // Add custom fields
  final bool? isVerified; // Add custom fields
  final Map<String, dynamic>? metadata;

  // Update factory method to parse your custom fields
  factory CustomUser.fromJson(Map<String, dynamic> json) {
    return CustomUser(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      email: json['email'] ?? '',
      displayName: json['displayName'] ?? json['name'],
      phoneNumber: json['phoneNumber'] ?? json['phone'],
      photoUrl: json['photoUrl'] ?? json['avatar'],
      role: json['role'],
      isVerified: json['isVerified'],
      metadata: json['metadata'] ?? json,
    );
  }
}
```

## 🧪 Testing

Run the app:

```bash
# Web
flutter run -d chrome

# macOS (after CocoaPods setup)
flutter run -d macos

# iOS (after Xcode setup)
flutter run -d ios

# Android (after Android Studio setup)
flutter run -d android
```

## 📝 Next Steps

1. **Set up your backend API** with the endpoints listed above
2. **Update the base URL** in `api_service.dart`
3. **Test authentication** by logging in through your app
4. **Update existing code** that used Firebase to use the new custom auth
5. **Customize the user model** to match your backend's user structure

## 🐛 Troubleshooting

### Authentication not persisting
- Check that SharedPreferences is working properly
- Verify the token is being saved: `await ApiService.getAuthToken()`

### API calls failing
- Check the base URL is correct
- Verify your backend is running and accessible
- Check network permissions in your app
- Look at the response status code and body for errors

### Type errors with user data
- Customize the `CustomUser.fromJson()` method to match your API's response structure
- Check that field names match (e.g., `displayName` vs `display_name`)

## 📚 Files to Review

- `lib/backend/api_service.dart` - HTTP client with auth
- `lib/backend/auth_service.dart` - Authentication logic
- `lib/auth/custom_auth/auth_util.dart` - Auth helper functions
- `lib/auth/custom_auth/custom_user_provider.dart` - User state management
- `lib/main.dart` - App initialization

---

**Happy Coding! 🚀**

If you need help with specific authentication flows or API integration, check the examples above or review the source files.

