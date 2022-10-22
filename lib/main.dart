import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leo_anime/pages/authentication/user_model.dart';
import 'package:leo_anime/services/auth.dart';
import 'package:leo_anime/services/auth_wrapper.dart';
import 'package:provider/provider.dart';

// Initialize FirebaseApp 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // StreamProvider to listen to User App Changes.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      catchError: ((context, error) => null),
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leo Anime',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

