import 'package:firebase_auth/firebase_auth.dart';
import 'package:leo_anime/pages/authentication/user_model.dart';

// Authentication Service for Sign In, SignOut and Reset Password Methods.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Creating AppUser based on FirebaseUser

  AppUser _AppUserFromFirebaseUser(User user) {
    return AppUser(
        uid: user.uid, isAnonymous: user.isAnonymous, email: user.email);
  }

  // Listen for User State Change using Stream
  // Return AppUser instead of FirebaseUser
  Stream<AppUser> get user {
    return _auth
        .authStateChanges()
        .map((firebaseUser) => _AppUserFromFirebaseUser(firebaseUser!));
  }

  // Sign In anonymously
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _AppUserFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // Sign In w/ Email Pass

  // Sign Up w/ Email/Pass

  // Sign Out
  Future signOutUser() async {
    try {
      _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
