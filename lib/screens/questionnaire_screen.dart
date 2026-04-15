import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/question.dart';
import 'package:flutter_application_1/screens/report_screen.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int _currentIndex = 0;
  final List<String> _answers = [];
  String? _selectedOption;

  void _onSelectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  void _onNext() {
    if (_selectedOption == null) return;

    final updatedAnswers = List<String>.from(_answers)..add(_selectedOption!);

    if (_currentIndex < flutterQuestions.length - 1) {
      setState(() {
        _answers.add(_selectedOption!);
        _currentIndex++;
        _selectedOption = null;
      });
    } else {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ReportScreen(questions: flutterQuestions, answers: updatedAnswers),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = flutterQuestions[_currentIndex];
    final isLast = _currentIndex == flutterQuestions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            Row(
              children: [
                Text(
                  'Question ${_currentIndex + 1} of ${flutterQuestions.length}',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: (_currentIndex + 1) / flutterQuestions.length,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Question text
            Text(
              question.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Answer options
            ...question.options.map((option) {
              final isSelected = _selectedOption == option;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => _onSelectOption(option),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary.withAlpha(20)
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            // Next / Finish button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _selectedOption != null ? _onNext : null,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isLast ? 'Finish' : 'Next',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
