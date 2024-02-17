import 'package:flutter/material.dart';
import 'package:movie_app/home_page.dart';
import 'package:movie_app/login_page.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieApp',
        home: const HomePage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        initialRoute: "/login",
        routes: {
          "/login": (context) => const LoginPage(),
          "/home": (context) => const HomePage(),
        });
  }
}
