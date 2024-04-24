



import 'package:flutter/material.dart';

class GradeScreenBody extends StatelessWidget {
  const GradeScreenBody({super.key, required this.studentGrade, required this.correctGrade});
  final int studentGrade;
  final int correctGrade;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: 250,
        width: 265,
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Grade:',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '${studentGrade.toStringAsFixed(1) } / $correctGrade',
                style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              getGradeMessage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGradeMessage() {
    double percentage = (studentGrade / correctGrade) * 100;
    if (percentage >= 90) {
      return const Text(
        'Excellent work!',
        style: TextStyle(color: Colors.green),
      );
    } else if (percentage >= 80) {
      return const Text(
        'Great job!',
        style: TextStyle(color: Colors.greenAccent),
      );
    } else if (percentage >= 70) {
      return const Text(
        'You did well!',
        style: TextStyle(color: Colors.amber),
      );
    } else if (percentage >= 60) {
      return const Text(
        'You passed, but consider studying more for future exams.',
        style: TextStyle(color: Colors.orange),
      );
    } else {
      return const Text(
        'You didn\'t pass. Keep studying and try again!',
        style: TextStyle(color: Colors.red),
      );
    }
  }
}
