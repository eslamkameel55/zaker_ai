import 'package:flutter/material.dart';
import 'ask_question_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';
import 'premium_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ذاكر بذكاء ✨'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.workspace_premium, color: Colors.amber),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PremiumScreen())),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("أهلاً بك يا بطل 👋", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("ماذا تريد أن تذاكر اليوم؟", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: _buildMainCard(context, "اكتب سؤالك", Icons.edit_note, Colors.blue, const AskQuestionScreen())),
                const SizedBox(width: 15),
                Expanded(child: _buildMainCard(context, "صوّر السؤال", Icons.camera_alt, Colors.purple, const AskQuestionScreen())),
              ],
            ),
            const SizedBox(height: 30),
            const Text("آخر النشاطات", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.history),
                    title: Text("سؤال في مادة الرياضيات #$index"),
                    subtitle: const Text("تم الشرح منذ ساعتين"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen())),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "السجل"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "حسابي"),
        ],
        onTap: (index) {
          if (index == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen()));
          if (index == 2) Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
        },
      ),
    );
  }

  Widget _buildMainCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}