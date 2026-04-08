import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  void onPressHomeButton(BuildContext context) {
    // Navigate to home screen without animation
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Home(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => onPressHomeButton(context),
      icon: const Icon(Icons.home),
      label: const Text('Go to home'),
    );
  }
}
