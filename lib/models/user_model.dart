
// Custom User Data Model instead of FireBase User model

class AppUser {
  final String uid;
  final bool isAnonymous;
  final String? email;
  AppUser({required this.uid,required this.isAnonymous,required this.email});
}
