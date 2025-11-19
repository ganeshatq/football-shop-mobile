import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
=======
import 'package:football_shop/screens/menu.dart';
>>>>>>> a46a031a41d7bf9128c6db5fb15add22733964eb

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

<<<<<<< HEAD
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
=======
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF144686),
          secondary: const Color(0xFF4885d4),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
>>>>>>> a46a031a41d7bf9128c6db5fb15add22733964eb
