class Question {
  final String text;
  final List<String> options;

  const Question({required this.text, required this.options});
}

const List<Question> flutterQuestions = [
  Question(
    text: 'What language is Flutter built with?',
    options: ['Dart', 'Kotlin', 'Swift', 'JavaScript'],
  ),
  Question(
    text: 'What is a StatelessWidget?',
    options: [
      'A widget that never changes',
      'A widget that can rebuild itself',
      'A widget with animation',
      'A widget with network calls',
    ],
  ),
  Question(
    text: 'Which widget is used to arrange children vertically?',
    options: ['Column', 'Row', 'Stack', 'Grid'],
  ),
  Question(
    text: 'What does "hot reload" do in Flutter?',
    options: [
      'Applies code changes without restarting the app',
      'Restarts the app and clears state',
      'Rebuilds the entire widget tree',
      'Compiles the app for release',
    ],
  ),
  Question(
    text: 'Which method is called when a StatefulWidget\'s state changes?',
    options: ['setState()', 'rebuild()', 'update()', 'refresh()'],
  ),
];
