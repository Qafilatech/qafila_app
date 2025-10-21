import '/backend/auth_service.dart';
import 'custom_user_provider.dart';

export 'custom_user_provider.dart';

// Sign in with email and password
Future<AuthResult> authManager_signInWithEmail(
  String email,
  String password,
) async {
  final result = await AuthService.signIn(email, password);
  if (result.success && result.user != null) {
    updateAuthUser(result.user);
  }
  return result;
}

// Sign up with email and password
Future<AuthResult> authManager_createAccountWithEmail(
  String email,
  String password,
) async {
  final result = await AuthService.signUp(email, password);
  if (result.success && result.user != null) {
    updateAuthUser(result.user);
  }
  return result;
}

// Sign in with phone number
Future<AuthResult> authManager_signInWithPhone(
  String phoneNumber,
  String otp,
) async {
  final result = await AuthService.signInWithPhone(phoneNumber, otp);
  if (result.success && result.user != null) {
    updateAuthUser(result.user);
  }
  return result;
}

// Send OTP
Future<bool> authManager_sendOTP(String phoneNumber) async {
  return await AuthService.sendOTP(phoneNumber);
}

// Sign out
Future<void> authManager_signOut() async {
  await signOut();
}

// Update profile
Future<AuthResult> authManager_updateProfile(Map<String, dynamic> data) async {
  final result = await AuthService.updateProfile(data);
  if (result.success && result.user != null) {
    updateAuthUser(result.user);
  }
  return result;
}

// Check if authenticated
Future<bool> authManager_isAuthenticated() async {
  return await AuthService.isAuthenticated();
}

// Get current user
QafilaTechCustAuthUser? get currentAuthUser => currentUser;

// Get authenticated user stream (for compatibility)
Stream<QafilaTechCustAuthUser> get authenticatedUserStream =>
    qafilaTechCustAuthUserStream();

// JWT token stream (for compatibility - can be left empty or implemented if needed)
final jwtTokenStream = Stream<String>.empty().asBroadcastStream();

