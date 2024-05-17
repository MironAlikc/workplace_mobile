import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workplace_mobile/core/theme/app_fonts.dart';
import 'package:workplace_mobile/features/auth/bloc/bloc/auth_bloc.dart';
import 'package:workplace_mobile/features/auth/widgets/bg_widget.dart';
import 'package:workplace_mobile/features/auth/widgets/custom_button.dart';
import 'package:workplace_mobile/features/auth/widgets/custom_text_field.dart';
import 'package:workplace_mobile/features/home_page/tasks_screen.dart';

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
  String? errorText = null;
  late SharedPreferences prefs;
  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(height: 20),
              CustomTextField(
                errorText: errorText,
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
              BlocListener<AuthBloc, AuthState>(
                listener: (_, state) async {
                  if (state is AuthError) {
                    errorText = 'Error';
                    setState(() {});
                  }
                  if (state is AuthSucces) {
                    prefs.setString(
                        'token', state.result.data!.toKen ?? 'null');
                    print(prefs.getString('token'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TasksScreen(),
                      ),
                    );
                    print(state.result.data!.toKen);
                  }
                },
                child: CustomButton(
                  lable: 'Вход',
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      GetTokenEvent(
                        login: controllerLogin.text,
                        password: controllerPassword.text,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  _launchInBrowser(toLaunch);
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
  //   Uri.parse('https://workplace.avn.kg/recovery'),