import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressBackButton() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home Screen', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),

            OutlinedButton.icon(
              onPressed: onPressBackButton,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go to Start'),
            ),
          ],
        ),
      ),
    );
  }
}
