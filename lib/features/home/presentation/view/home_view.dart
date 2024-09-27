import 'package:dalel/core/functions/navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut().then(
                  (value) => customPushReplacementNavigation(context, "/login"),
                );
          },
          child: const Text("sign out"),
        ),
      ),
    );
  }
}
