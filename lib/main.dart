import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leo_anime/providers/api_provider.dart';
import 'package:leo_anime/services/authentication/auth.dart';
import 'package:leo_anime/services/authentication/auth_wrapper.dart';
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
    final AuthService authInstance = AuthService(auth: FirebaseAuth.instance);
    return MultiProvider(
      providers: [
        StreamProvider<User?>(
          initialData: null,
          create: ((context) => authInstance.user),
        ),
        Provider<AuthService>(
          create: (context) => authInstance,
        ),
        ChangeNotifierProvider(create: ((context) => ApiProvider()))
      ],
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
