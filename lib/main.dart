import 'package:flutter/material.dart';

void main() {
  runApp(const ZakerAIApp());
}

class ZakerAIApp extends StatelessWidget {
  const ZakerAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zaker AI',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
      ),
      home: const SplashScreen(),
    );
  }
}

class AppColors {
  static const primary = Color(0xFF4F46E5);
  static const secondary = Color(0xFF7C3AED);
  static const bg = Color(0xFFF8FAFC);
  static const dark = Color(0xFF0F172A);
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school_rounded, color: Colors.white, size: 90),
              const SizedBox(height: 20),
              const Text('Zaker AI', style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('ذاكر بذكاء', style: TextStyle(color: Colors.white70, fontSize: 22)),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary),
                  child: const Text('ابدأ الآن', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('أهلاً بك 👋', textAlign: TextAlign.right, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.dark)),
              const SizedBox(height: 10),
              const Text('سجّل دخولك وابدأ حل أسئلتك بسهولة', textAlign: TextAlign.right, style: TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 30),
              const TextField(textAlign: TextAlign.right, decoration: InputDecoration(labelText: 'البريد الإلكتروني', border: OutlineInputBorder())),
              const SizedBox(height: 14),
              const TextField(textAlign: TextAlign.right, obscureText: true, decoration: InputDecoration(labelText: 'كلمة المرور', border: OutlineInputBorder())),
              const SizedBox(height: 22),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                  child: const Text('دخول', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Zaker AI'), centerTitle: true, backgroundColor: AppColors.bg),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('صوّر سؤالك', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('واحصل على شرح عربي خطوة بخطوة', textAlign: TextAlign.right, style: TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 22),
            HomeButton(icon: Icons.edit_note_rounded, title: 'اكتب السؤال', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AskScreen()))),
            HomeButton(icon: Icons.photo_camera_rounded, title: 'رفع صورة السؤال', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CameraScreen()))),
            HomeButton(icon: Icons.history_rounded, title: 'السجل', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreen()))),
            HomeButton(icon: Icons.workspace_premium_rounded, title: 'Premium', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen()))),
            HomeButton(icon: Icons.person_rounded, title: 'البروفايل', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()))),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const HomeButton({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class AskScreen extends StatefulWidget {
  const AskScreen({super.key});
  @override
  State<AskScreen> createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  final controller = TextEditingController();
  String answer = 'الإجابة ستظهر هنا بعد الضغط على حل السؤال.';

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      title: 'اكتب السؤال',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(controller: controller, textAlign: TextAlign.right, minLines: 4, maxLines: 8, decoration: const InputDecoration(hintText: 'اكتب سؤالك هنا...', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => setState(() => answer = 'شرح تجريبي: هنا سيتم ربط الذكاء الاصطناعي لاحقًا لحل السؤال خطوة بخطوة.'),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
            child: const Text('حل السؤال'),
          ),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Text(answer, textAlign: TextAlign.right, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});
  @override
  Widget build(BuildContext context) => const SimplePage(title: 'رفع صورة السؤال', child: Center(child: Text('هنا هنضيف زر الكاميرا ورفع الصورة لاحقًا', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))));
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) => const SimplePage(title: 'السجل', child: Center(child: Text('لا توجد أسئلة محفوظة حاليًا', style: TextStyle(fontSize: 18))));
}

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});
  @override
  Widget build(BuildContext context) => SimplePage(title: 'Premium', child: Column(children: [
    const Icon(Icons.workspace_premium_rounded, size: 80, color: AppColors.secondary),
    const SizedBox(height: 16),
    const Text('اشترك للحصول على عدد أكبر من الأسئلة ومميزات إضافية', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
    const SizedBox(height: 20),
    ElevatedButton(onPressed: () {}, child: const Text('اشترك قريبًا')),
  ]));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const SimplePage(title: 'البروفايل', child: Column(children: [
    CircleAvatar(radius: 45, child: Icon(Icons.person, size: 55)),
    SizedBox(height: 14),
    Text('طالب Zaker AI', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    Text('نسخة تجريبية'),
  ]));
}

class SimplePage extends StatelessWidget {
  final String title;
  final Widget child;
  const SimplePage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: Text(title), centerTitle: true, backgroundColor: AppColors.bg),
      body: Padding(padding: const EdgeInsets.all(20), child: child),
    );
  }
}
