import 'package:flutter/material.dart';
import 'package:leo_anime/pages/authentication/authenticate.dart';
import 'package:leo_anime/pages/authentication/user_model.dart';
import 'package:leo_anime/pages/main_page.dart';
import 'package:provider/provider.dart';

//  Auth Wrapper to listen to changes to User Auth State and then redirect accordingly.
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AppUser? userData = Provider.of<AppUser?>(context);


    // Redirect user to HomePage or Authenticate

    if (userData == null) {
      return const Authenticate();
    } else {
      return const MyHomePage(title: 'Leo Anime');
    }
  }
}
