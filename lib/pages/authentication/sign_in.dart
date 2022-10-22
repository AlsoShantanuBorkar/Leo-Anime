import 'package:flutter/material.dart';
import 'package:leo_anime/services/auth.dart';

import '../../components/app_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService authInstance = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(17, 20, 34, 1),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: "Leo Anime")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(17, 20, 34, 1)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () async {
                dynamic result = await authInstance.signInAnonymously();
                if (result == null) {
                  // print('error');
                } else {
                  // print('signed in');
                }
                //  print(result.uid);
                //  print(result.isAnonymous);
                //  print(result.email);
              },
              child: const Text('TextButton'),
            ),
          ),
        ],
      ),
    );
  }
}
