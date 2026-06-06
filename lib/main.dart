import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.cairoTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class AppColors {
  static const primary = Color(0xFF4F46E5);
  static const secondary = Color(0xFF7C3AED);
  static const bg = Color(0xFFF8FAFC);
  static const text = Color(0xFF0F172A);
  static const muted = Color(0xFF64748B);
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.18),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(Icons.psychology_alt_rounded, color: Colors.white, size: 58),
              ),
              const SizedBox(height: 20),
              const Text('Zaker AI', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('ذاكر بذكاء', style: TextStyle(color: Colors.white70, fontSize: 18)),
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
            children: [
              const Spacer(),
              const Icon(Icons.school_rounded, size: 76, color: AppColors.primary),
              const SizedBox(height: 16),
              const Text('أهلاً بيك في ذاكر بذكاء', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.text)),
              const SizedBox(height: 8),
              const Text('صوّر السؤال وخد شرح عربي بسيط خطوة بخطوة', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: AppColors.muted)),
              const SizedBox(height: 34),
              _input('البريد الإلكتروني', Icons.email_outlined),
              const SizedBox(height: 14),
              _input('كلمة المرور', Icons.lock_outline, obscure: true),
              const SizedBox(height: 22),
              FilledButton(
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: AppColors.primary),
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainShell())),
                child: const Text('ابدأ المذاكرة', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              TextButton(onPressed: () {}, child: const Text('إنشاء حساب جديد')),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(String hint, IconData icon, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  final pages = const [HomeScreen(), AskScreen(), HistoryScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.camera_alt_outlined), selectedIcon: Icon(Icons.camera_alt), label: 'اسأل'),
          NavigationDestination(icon: Icon(Icons.history), label: 'السجل'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'حسابي'),
        ],
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('صباح الخير 👋', style: TextStyle(color: AppColors.muted)),
            const Text('جاهز تذاكر بذكاء؟', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.text)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 34),
                  const SizedBox(height: 12),
                  const Text('صوّر أي سؤال', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('واحصل على حل وشرح مبسط بالعربي', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 18),
                  FilledButton.tonal(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AskScreen())),
                    child: const Text('حل سؤال الآن'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('الأدوات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _tool(Icons.calculate_outlined, 'حل مسائل', 'رياضيات وفيزياء وكيمياء'),
            _tool(Icons.summarize_outlined, 'تلخيص درس', 'اختصر أي درس طويل'),
            _tool(Icons.quiz_outlined, 'اختبار سريع', 'راجع نفسك قبل الامتحان'),
          ],
        ),
      ),
    );
  }

  Widget _tool(IconData icon, String title, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        CircleAvatar(backgroundColor: AppColors.primary.withOpacity(.1), child: Icon(icon, color: AppColors.primary)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(sub, style: const TextStyle(color: AppColors.muted, fontSize: 13))])),
        const Icon(Icons.chevron_right),
      ]),
    );
  }
}

class AskScreen extends StatelessWidget {
  const AskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('اسأل الذكاء الاصطناعي')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(26), border: Border.all(color: Colors.black12)),
              child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_a_photo_outlined, size: 60, color: AppColors.primary),
                SizedBox(height: 12),
                Text('ارفع أو صوّر السؤال', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('PNG / JPG / صورة من الكاميرا', style: TextStyle(color: AppColors.muted)),
              ]),
            ),
            const SizedBox(height: 18),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(hintText: 'أو اكتب السؤال هنا...', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)), borderSide: BorderSide.none)),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: AppColors.primary),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AnswerScreen())),
              icon: const Icon(Icons.auto_awesome),
              label: const Text('حل وشرح السؤال'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('الإجابة')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _card('الإجابة المختصرة', 'هنا ستظهر الإجابة النهائية للسؤال بعد ربط الذكاء الاصطناعي.'),
          _card('الشرح خطوة بخطوة', '1. فهم المطلوب من السؤال.\n2. استخراج المعطيات.\n3. تطبيق القانون المناسب.\n4. كتابة الناتج النهائي بوضوح.'),
          _card('نصيحة للمذاكرة', 'راجع نفس النوع من الأسئلة 3 مرات: اليوم، بعد يومين، وقبل الامتحان.'),
        ],
      ),
    );
  }

  Widget _card(String title, String body) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(body, style: const TextStyle(height: 1.7, color: AppColors.text)),
      ]),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['مسألة رياضيات - معادلات', 'سؤال فيزياء - السرعة', 'تلخيص درس تاريخ'];
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('سجل الأسئلة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: items.length,
        itemBuilder: (_, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.article_outlined, color: AppColors.primary),
            title: Text(items[i]),
            subtitle: const Text('تم الحل منذ قليل'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('حسابي')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 42, backgroundColor: AppColors.primary, child: Icon(Icons.person, color: Colors.white, size: 46)),
          const SizedBox(height: 12),
          const Center(child: Text('طالب ذكي', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          const SizedBox(height: 22),
          _tile(Icons.workspace_premium_outlined, 'الاشتراك Premium', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen()))),
          _tile(Icons.settings_outlined, 'الإعدادات', () {}),
          _tile(Icons.help_outline, 'المساعدة', () {}),
          _tile(Icons.logout, 'تسجيل الخروج', () {}),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String title, VoidCallback onTap) => Card(child: ListTile(leading: Icon(icon, color: AppColors.primary), title: Text(title), trailing: const Icon(Icons.chevron_right), onTap: onTap));
}

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Premium')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(gradient: const LinearGradient(colors: [AppColors.secondary, AppColors.primary]), borderRadius: BorderRadius.circular(28)),
            child: const Column(children: [
              Icon(Icons.workspace_premium, size: 60, color: Colors.white),
              SizedBox(height: 12),
              Text('Zaker AI Premium', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text('حلول أكثر، شرح أسرع، بدون إعلانات', style: TextStyle(color: Colors.white70)),
            ]),
          ),
          const SizedBox(height: 20),
          const Text('المميزات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const ListTile(leading: Icon(Icons.check_circle, color: AppColors.primary), title: Text('عدد أسئلة أكبر يوميًا')),
          const ListTile(leading: Icon(Icons.check_circle, color: AppColors.primary), title: Text('شرح مفصل خطوة بخطوة')),
          const ListTile(leading: Icon(Icons.check_circle, color: AppColors.primary), title: Text('حفظ وتنظيم كل الأسئلة')),
          const Spacer(),
          FilledButton(onPressed: () {}, style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: AppColors.primary), child: const Text('اشترك الآن')),
        ]),
      ),
    );
  }
}
