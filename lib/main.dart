import 'package:flutter/material.dart';
import 'package:listeverywhere_app/reusable_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                  color: Colors.amber,
                  margin: const EdgeInsets.all(15.0),
                  child: const Center(
                    child: Text("Welcome to ListEverywhere!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 42.0)),
                  )),
            ),
            Expanded(
              child: ReusableButton(
                color: Colors.amber[200],
                text: "Sign in",
                onTap: () {},
                padding: const EdgeInsets.all(15.0),
              ),
            ),
            Expanded(
              child: ReusableButton(
                color: Colors.amber[300],
                text: "Sign up for a new account",
                onTap: () {},
                padding: const EdgeInsets.all(15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
