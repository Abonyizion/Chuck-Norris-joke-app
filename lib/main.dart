import 'package:flutter/material.dart';
import 'package:joke_app/pages/homePage.dart';
import 'package:joke_app/pages/introPage.dart';
import 'package:joke_app/providerService/jokeProvider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JokeProvider>(
            create: (_) => JokeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        home: const IntroPage(),
      ),
    );
  }
}
