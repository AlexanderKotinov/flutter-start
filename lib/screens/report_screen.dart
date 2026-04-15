import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/question.dart';

class ReportScreen extends StatelessWidget {
  final List<Question> questions;
  final List<String> answers;

  const ReportScreen({
    super.key,
    required this.questions,
    required this.answers,
  });

  // Correct answers are always the first option in each question
  int get _correctCount =>
      List.generate(questions.length, (i) => answers[i] == questions[i].options[0] ? 1 : 0)
          .fold(0, (sum, v) => sum + v);

  @override
  Widget build(BuildContext context) {
    final correct = _correctCount;
    final total = questions.length;
    final percent = (correct / total * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Report'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Score summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withAlpha(15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withAlpha(60),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '$correct / $total',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$percent% correct',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Answers list
            Expanded(
              child: ListView.separated(
                itemCount: questions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final isCorrect = answers[i] == questions[i].options[0];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? Colors.green.withAlpha(15)
                          : Colors.red.withAlpha(15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isCorrect
                            ? Colors.green.shade300
                            : Colors.red.shade300,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isCorrect ? Icons.check_circle : Icons.cancel,
                              color: isCorrect ? Colors.green : Colors.red,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Q${i + 1}: ${questions[i].text}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your answer: ${answers[i]}',
                          style: TextStyle(
                            fontSize: 13,
                            color: isCorrect ? Colors.green.shade700 : Colors.red.shade700,
                          ),
                        ),
                        if (!isCorrect) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Correct: ${questions[i].options[0]}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Restart button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Back to Start', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
