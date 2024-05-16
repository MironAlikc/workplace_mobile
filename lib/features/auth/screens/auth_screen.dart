import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workplace_mobile/core/theme/app_fonts.dart';
import 'package:workplace_mobile/features/auth/widgets/bg_widget.dart';
import 'package:workplace_mobile/features/auth/widgets/custom_button.dart';
import 'package:workplace_mobile/features/auth/widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();

  final Uri toLaunch =
      Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
  bool isPasswordType = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('AppBar'),
      ),
      body: BGWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'Авторизация',
                style: AppFonts.s32w400,
              ),
              CustomTextField(
                icon: Icons.account_circle_rounded,
                onChanged: (value) {},
                controller: controllerLogin,
                hintText: 'Логин',
                onIconPress: () {},
              ),
              CustomTextField(
                icon: Icons.account_circle_rounded,
                onChanged: (value) {},
                isPassword: isPasswordType,
                controller: controllerPassword,
                hintText: 'Пароль',
                onIconPress: () {
                  isPasswordType = !isPasswordType;
                  setState(() {});
                },
              ),
              const SizedBox(height: 58),
              CustomButton(
                lable: 'Вход',
                onPressed: () {},
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  _launchInBrowser(toLaunch);
                  // _launchInBrowser(
                  //   Uri.parse('https://workplace.avn.kg/recovery'),
                  // );
                },
                child: const Text(
                  'Забыли пароль?',
                  style: AppFonts.s12w500,
                ),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
