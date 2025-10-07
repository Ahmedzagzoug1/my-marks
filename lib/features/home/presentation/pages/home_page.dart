import 'package:flutter/material.dart';
import 'package:my_marks/core/routes/routes.dart';
import 'package:my_marks/features/home/presentation/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String telegramBotUrl = "https://t.me/YourBotUsername";

  Future<void> _openTelegramBot() async {
    final Uri url = Uri.parse("https://t.me/YourBotUsername");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print('هناك مشكلة فى فتح الرابط');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("علاماتي")),
      drawer: AppDrawer(onLogout: (){
Navigator.pushNamedAndRemoveUntil(context, Routes.signInRoute, (route){
  return false;
});
      }),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 100, color: Colors.blue),
            const SizedBox(height: 16),

            const Text(
              "مرحباً بك في تطبيق علاماتي 🎓",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            const Text(
              "تطبيق يساعد طلاب الجامعات في سوريا على عرض علاماتهم بسهولة، "
                  "مع إمكانية الوصول لبوت التليغرام لعرض البيانات بشكل أسرع.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 32),

            ElevatedButton.icon(
              onPressed: _openTelegramBot,
              icon: const Icon(Icons.telegram),
              label: const Text("انتقل إلى بوت التليغرام"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}
