import 'package:rxdart/rxdart.dart';

import '../base_auth_user_provider.dart';
import '/backend/auth_service.dart';

export '../base_auth_user_provider.dart';

class QafilaTechCustAuthUser extends BaseAuthUser {
  QafilaTechCustAuthUser({
    required this.loggedIn,
    required String uid,
    String? email,
    String? displayName,
    String? phoneNumber,
    String? photoUrl,
    this.userData = const {},
  }) : _authUserInfo = AuthUserInfo(
          uid: uid,
          email: email,
          displayName: displayName,
          phoneNumber: phoneNumber,
          photoUrl: photoUrl,
        );

  final bool loggedIn;
  final AuthUserInfo _authUserInfo;
  final Map<String, dynamic> userData;

  @override
  bool get emailVerified => true; // You can track this in your custom backend

  @override
  AuthUserInfo get authUserInfo => _authUserInfo;

  @override
  Future? delete() async {
    // TODO: Implement delete user account API call
    await AuthService.signOut();
  }

  @override
  Future? updateEmail(String email) async {
    // TODO: Implement update email API call
    return await AuthService.updateProfile({'email': email});
  }

  @override
  Future? updatePassword(String newPassword) async {
    // TODO: Implement update password API call
    return await AuthService.updateProfile({'password': newPassword});
  }

  @override
  Future? sendEmailVerification() async {
    // TODO: Implement send email verification API call
    return Future.value();
  }

  factory QafilaTechCustAuthUser.fromCustomUser(CustomUser? user) {
    return QafilaTechCustAuthUser(
      loggedIn: user != null,
      uid: user?.id ?? '',
      phoneNumber: user?.phoneNumber,
      email: user?.email ?? '',
      displayName: user?.displayName,
      photoUrl: user?.photoUrl,
      userData: user?.metadata ?? {},
    );
  }
}

/// Generates a stream of the authenticated user.
BehaviorSubject<QafilaTechCustAuthUser> qafilaTechCustAuthUserSubject =
    BehaviorSubject.seeded(QafilaTechCustAuthUser(
  loggedIn: false,
  uid: '',
  userData: {},
));

Stream<QafilaTechCustAuthUser> qafilaTechCustAuthUserStream() =>
    qafilaTechCustAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);

QafilaTechCustAuthUser? currentUser;

// Initialize auth user
Future<void> initializeAuth() async {
  final user = await AuthService.getCurrentUser();
  final authUser = QafilaTechCustAuthUser.fromCustomUser(user);
  qafilaTechCustAuthUserSubject.add(authUser);
  currentUser = authUser;
}

// Update auth user
void updateAuthUser(CustomUser? user) {
  final authUser = QafilaTechCustAuthUser.fromCustomUser(user);
  qafilaTechCustAuthUserSubject.add(authUser);
  currentUser = authUser;
}

// Sign out
Future<void> signOut() async {
  await AuthService.signOut();
  updateAuthUser(null);
}

