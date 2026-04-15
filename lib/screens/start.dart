import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/base/base_button.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/questionnaire_screen.dart';

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

  void onPressQuizButton(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const QuestionnaireScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BaseButton(
          text: 'Go to home',
          onTap: () => onPressHomeButton(context),
        ),
        const SizedBox(height: 12),
        BaseButton(
          text: 'Take Flutter Quiz',
          onTap: () => onPressQuizButton(context),
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
