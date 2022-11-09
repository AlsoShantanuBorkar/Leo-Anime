
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkBody extends StatelessWidget {
  const BookmarkBody({super.key});

  @override
  Widget build(BuildContext context) {
    final User? userData = Provider.of<User?>(context);
    if (userData!.email == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "not hello",
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          )
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          " hello",
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        )
      ],
    );
  }
}
