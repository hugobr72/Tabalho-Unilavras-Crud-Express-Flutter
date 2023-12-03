import 'package:flutter/material.dart';
import 'src/views/Home.dart';
import 'src/views/ClienteView.dart';
import 'src/views/ProdutoView.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(
              title: "Home",
            ),
        "/produto": (context) => const ProdutoView(
              title: "Produto",
            ),
        "/cliente": (context) => const ClienteView(
              title: "Cliente",
            ),
      },
    );
  }
}
