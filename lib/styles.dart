import 'package:flutter/material.dart';

class Style extends StatelessWidget {
  const Style(this.text, {super.key});
  final String text;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          height: 1.3,
        ),
      ),
    );
  }
}

class StartQuizButton extends StatelessWidget {
  final String startText;
  final VoidCallback onPressed;
  const StartQuizButton({required this.startText, required this.onPressed, super.key});

  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_right_alt),
      label: Style(startText),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(223, 100, 178, 211),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(Colors.blueAccent.withOpacity(0.5)),
        elevation: WidgetStateProperty.all(8),
        shadowColor: WidgetStateProperty.all(Colors.blue.withOpacity(0.3)),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onTap;

  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      width: double.infinity/2,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
          backgroundColor: const Color.fromARGB(223, 80, 158, 191), // Darker shade of start button color
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
