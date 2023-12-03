import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Navegação para telas de cliente e produto',
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/produto');
                },
                child: const Text("Produto")),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cliente');
                },
                child: const Text("Cliente"))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
