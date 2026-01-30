import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class LessonScreen extends StatelessWidget {
  final String lessonId = "lesson_1";

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFFF5F9F9),
      appBar: AppBar(
        title: Text("The Zen Foundation", style: TextStyle(color: Colors.teal.shade900)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.teal),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to your first quest. Let’s begin with mindful breathing.",
              style: TextStyle(fontSize: 18, color: Colors.teal.shade800, height: 1.5),
            ),
            SizedBox(height: 30),

            // Video Placeholder
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle_filled, size: 80, color: Colors.teal),
                    SizedBox(height: 10),
                    Text("Watch Guidance", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            Text("Instructions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal.shade900)),
            SizedBox(height: 15),
            _buildInstructionItem("Find a quiet space and sit comfortably."),
            _buildInstructionItem("Close your eyes and focus on your natural breath."),
            _buildInstructionItem("Inhale deeply through your nose for 4 counts."),
            _buildInstructionItem("Exhale slowly through your mouth for 6 counts."),

            SizedBox(height: 50),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  appState.completeLesson(lessonId, 50, 10);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Quest Complete! +50 XP, +10 Coins"),
                      backgroundColor: Colors.teal,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: Text("Complete Lesson", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, size: 20, color: Colors.teal),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
