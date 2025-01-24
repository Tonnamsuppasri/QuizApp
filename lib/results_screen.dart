import 'package:flutter/material.dart';
import 'package:myapp/model/quiz_model.dart';
// ถ้าคุณต้องการนำผู้ใช้กลับไปหน้าเริ่ม

class ResultScreen extends StatelessWidget {
  ResultScreen({
    required this.selectedAnswers,
    super.key,
  });

  final List<String> selectedAnswers;

  final List<QuizModel> questions = [
    QuizModel(
      'What are the main building blocks of Flutter UIs?',
      ['Widgets', 'Components', 'Blocks', 'Functions'],
    ),
    QuizModel(
      'How are Flutter UIs built?',
      [
        'By combining widgets in code',
        'By combining widgets in a visual editor',
        'By defining widgets in config files',
        'By using XCode for iOS and Android Studio for Android'
      ],
    ),
    QuizModel(
      'What\'s the purpose of a StatefulWidget?',
      [
        'Update UI as data changes',
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data'
      ],
    ),
    QuizModel(
      'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      [
        'StatelessWidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above'
      ],
    ),
    QuizModel(
      'What happens if you change data in a StatelessWidget?',
      [
        'The UI is not updated',
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'Any nested StatefulWidgets are updated'
      ],
    ),
    QuizModel(
      'How should you update data inside of StatefulWidgets?',
      [
        'By calling setState()',
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int correctCount = 0;

    // คำนวณจำนวนคำตอบที่ถูกต้อง
    for (int i = 0; i < selectedAnswers.length; i++) {
      final correctAnswer =
          questions[i].answers[0]; // สมมุติว่า answers[0] เป็นคำตอบที่ถูกต้อง
      if (selectedAnswers[i] == correctAnswer) {
        correctCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // ปิดปุ่มกลับ
        flexibleSpace: const Center(
          child: Text(
            'Result',
            style: TextStyle(
              fontSize: 24, // ขนาดตัวอักษร
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'You answered $correctCount of ${questions.length} questions correctly!',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // แสดงคำถามและคำตอบที่ผู้ใช้เลือก
                Expanded(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      final userAnswer = selectedAnswers[index];
                      final correctAnswer = question.answers[
                          0]; // สมมุติว่า answers[0] เป็นคำตอบที่ถูกต้อง

                      return ListTile(
                        title: Text(
                          question.question,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your answer: $userAnswer',
                              style: TextStyle(
                                color: userAnswer == correctAnswer
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            Text(
                              'Correct answer: $correctAnswer',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Divider(color: Colors.white),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // ปุ่มเริ่มใหม่ (รีสตาร์ท) เป็นไอคอน
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลาง
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh,
                          size: 40, color: Colors.white),
                      onPressed: () {
                        // กลับไปที่หน้า StartScreen
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                    ),
                    const SizedBox(width: 10), // ช่องว่างระหว่างไอคอนและข้อความ
                    const Text(
                      '<- Restart Quiz!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
