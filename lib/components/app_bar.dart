import 'package:flutter/material.dart';
import 'package:leo_anime/services/auth.dart';

// Custom App Bar for HomePage,Search Page , Bookmarks 
class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();

    return AppBar(
      actions: [
        TextButton.icon(
            onPressed: () async {
              await auth.signOutUser();
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            label: const Text(""))
      ],
      iconTheme: const IconThemeData(color: Color.fromRGBO(27, 30, 47, 1)),
      elevation: 10,
      scrolledUnderElevation: 10,
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(27, 30, 47, 1),
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          letterSpacing: 4,
          color: Colors.white,
        ),
      ),
    );
  }
}
