import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider untuk CookieRequest agar bisa digunakan di seluruh aplikasi
    return Provider<CookieRequest>(
      create: (_) => CookieRequest(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Football Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.blueAccent[400],
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
