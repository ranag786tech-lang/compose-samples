import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF5F9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10, left: 20, right: 20, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
          ),
          child: Row(
            children: [
              // XP Bar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Level ${appState.level}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
                    SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: appState.xpProgress,
                        backgroundColor: Colors.teal.shade50,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                        minHeight: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              // Coins
              _buildBalanceIcon(Icons.monetization_on, appState.coins.toString(), Colors.orange),
              SizedBox(width: 15),
              // Diamonds
              _buildBalanceIcon(Icons.diamond, appState.diamonds.toString(), Colors.blue),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Streak Section
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.local_fire_department, size: 100, color: Colors.teal),
                  Positioned(
                    bottom: 25,
                    child: Text(
                      appState.streak.toString(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "STREAK",
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.teal.shade900),
              ),
            ),
            SizedBox(height: 30),

            // Today's Goal Card
            Text("Today's Goal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal.shade900)),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer, color: Colors.teal),
                        SizedBox(width: 10),
                        Text("5 min Morning Stretch", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.0, // Mock progress for today
                        backgroundColor: Colors.teal.shade50,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            // Learning Path
            Text("Your Quest", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal.shade900)),
            SizedBox(height: 10),
            _buildLessonItem(
              context,
              title: "The Zen Foundation",
              subtitle: "Stage 1: Yoga Basics",
              completed: appState.isLessonCompleted("lesson_1"),
              onTap: () => Navigator.pushNamed(context, '/lesson_1'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceIcon(IconData icon, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        SizedBox(width: 4),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildLessonItem(BuildContext context, {required String title, required String subtitle, required bool completed, required VoidCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: completed ? Colors.teal : Colors.teal.shade100,
          child: Icon(completed ? Icons.check : Icons.play_arrow, color: completed ? Colors.white : Colors.teal),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
