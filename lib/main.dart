import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workplace_mobile/core/dio/dio_setting.dart';
import 'package:workplace_mobile/features/auth/bloc/bloc/auth_bloc.dart';
import 'package:workplace_mobile/features/auth/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitWidget(
        child: AuthScreen(),
      ),
    );
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DioSettings(),
      child: BlocProvider(
        create: (context) => AuthBloc(),
        child: Container(),
      ),
    );
  }
}
