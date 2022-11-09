// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

// Authentication Service for Sign In, SignOut and Reset Password Methods.
class AuthService {
  final FirebaseAuth auth;
  AuthService({
    required this.auth,
  });


  // Listen for User State Change using Stream
  Stream<User?> get user {
    return auth.authStateChanges();
  }

  // Sign In anonymously
  Future signInAnonymously() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User user = result.user!;
      return user;
    } catch (e) {
      return null;
    }
  }

  // Sign In w/ Email Pass

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return user;
    } catch (e) {
      return null;
    }
  }

  // Sign Up w/ Email/Pass
  Future signUp(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return user;
    } catch (e) {
      return null;
    }
  }

  // Sign Out
  Future signOutUser() async {
    try {
      auth.signOut();
    } catch (e)  {
      return null;
    }
  }
}
