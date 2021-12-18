import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Password Generator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  String _password = 'Nichts';

  void _generatePassword(String masterPW) {
    setState(() {
      //TODO: Website aus Textfeld lesen
      _password =
          Crypt.sha256('web.com', salt: _controller.text).hash.substring(0, 10);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    //TODO: Delete for release
    _controller.text = '12345';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              //TODO: TextField für Website
              child: TextField(
                controller: _controller,
                autocorrect: false,
                obscureText: true,
                enableSuggestions: false,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Master Password',
                    labelText: 'Master Password'),
              ),
            ),
            ElevatedButton(
              // übergeben von Funktion mit Parameter
              onPressed: () => _generatePassword(_controller.text),
              child: Text('Generate Password'),
            ),
            //TODO: Text formatieren https://api.flutter.dev/flutter/painting/TextStyle-class.html
            Text(_password),
          ],
        ),
      ),
    );
  }
}
