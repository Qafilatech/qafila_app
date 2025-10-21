import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class AuthService {
  static const String _userKey = 'user_data';

  // Sign in with email and password
  static Future<AuthResult> signIn(String email, String password) async {
    try {
      final response = await ApiService.post('/auth/login', {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Save the token
        await ApiService.setAuthToken(data['token']);
        
        // Save user data
        await _saveUser(data['user']);
        
        return AuthResult(success: true, user: CustomUser.fromJson(data['user']));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Login failed';
        return AuthResult(success: false, error: error);
      }
    } catch (e) {
      return AuthResult(success: false, error: e.toString());
    }
  }

  // Sign up with email and password
  static Future<AuthResult> signUp(String email, String password, {Map<String, dynamic>? additionalData}) async {
    try {
      final body = {
        'email': email,
        'password': password,
        ...?additionalData,
      };

      final response = await ApiService.post('/auth/register', body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        
        // Save the token
        await ApiService.setAuthToken(data['token']);
        
        // Save user data
        await _saveUser(data['user']);
        
        return AuthResult(success: true, user: CustomUser.fromJson(data['user']));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Registration failed';
        return AuthResult(success: false, error: error);
      }
    } catch (e) {
      return AuthResult(success: false, error: e.toString());
    }
  }

  // Sign in with phone number
  static Future<AuthResult> signInWithPhone(String phoneNumber, String otp) async {
    try {
      final response = await ApiService.post('/auth/phone/verify', {
        'phone': phoneNumber,
        'otp': otp,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Save the token
        await ApiService.setAuthToken(data['token']);
        
        // Save user data
        await _saveUser(data['user']);
        
        return AuthResult(success: true, user: CustomUser.fromJson(data['user']));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Phone verification failed';
        return AuthResult(success: false, error: error);
      }
    } catch (e) {
      return AuthResult(success: false, error: e.toString());
    }
  }

  // Send OTP to phone number
  static Future<bool> sendOTP(String phoneNumber) async {
    try {
      final response = await ApiService.post('/auth/phone/send-otp', {
        'phone': phoneNumber,
      });

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    await ApiService.clearAuthToken();
    await _clearUser();
  }

  // Get current user
  static Future<CustomUser?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    
    if (userData != null) {
      return CustomUser.fromJson(jsonDecode(userData));
    }
    
    return null;
  }

  // Check if user is authenticated
  static Future<bool> isAuthenticated() async {
    final token = await ApiService.getAuthToken();
    return token != null;
  }

  // Update user profile
  static Future<AuthResult> updateProfile(Map<String, dynamic> data) async {
    try {
      final response = await ApiService.put('/auth/profile', data);

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body)['user'];
        await _saveUser(userData);
        
        return AuthResult(success: true, user: CustomUser.fromJson(userData));
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Update failed';
        return AuthResult(success: false, error: error);
      }
    } catch (e) {
      return AuthResult(success: false, error: e.toString());
    }
  }

  // Save user data locally
  static Future<void> _saveUser(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(userData));
  }

  // Clear user data locally
  static Future<void> _clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}

// Custom User model
class CustomUser {
  final String id;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final String? photoUrl;
  final Map<String, dynamic>? metadata;

  CustomUser({
    required this.id,
    required this.email,
    this.displayName,
    this.phoneNumber,
    this.photoUrl,
    this.metadata,
  });

  factory CustomUser.fromJson(Map<String, dynamic> json) {
    return CustomUser(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      email: json['email'] ?? '',
      displayName: json['displayName'] ?? json['name'] ?? json['display_name'],
      phoneNumber: json['phoneNumber'] ?? json['phone'] ?? json['phone_number'],
      photoUrl: json['photoUrl'] ?? json['photo_url'] ?? json['avatar'],
      metadata: json['metadata'] ?? json,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'metadata': metadata,
    };
  }
}

// Auth result model
class AuthResult {
  final bool success;
  final CustomUser? user;
  final String? error;

  AuthResult({
    required this.success,
    this.user,
    this.error,
  });
}

