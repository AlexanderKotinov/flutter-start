import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/base/base_button.dart';

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
            BaseButton(
              text: 'Go to Start',
              onTap: onPressBackButton,
            ),
          ],
        ),
      ),
    );
  }
}
