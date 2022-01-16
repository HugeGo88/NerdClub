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
  late TextEditingController _controllerMasterPassword;
  late TextEditingController _controllerWebsite;
  String _password = 'Nichts';

  void _generatePassword(String masterPW) {
    setState(() {
      _password = Crypt.sha256(_controllerWebsite.text, salt: _controllerMasterPassword.text).hash.substring(0, 10);
    });
  }

  @override
  void initState() {
    super.initState();
    _controllerMasterPassword = TextEditingController();
    _controllerWebsite = TextEditingController();
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
              child: TextField(
                controller: _controllerMasterPassword,
                autocorrect: false,
                obscureText: true,
                enableSuggestions: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Master Password',
                  labelText: 'Master Password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerWebsite,
                autocorrect: false,
                enableSuggestions: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Webiste',
                  labelText: 'Website',
                ),
              ),
            ),
            ElevatedButton(
              // übergeben von Funktion mit Parameter
              onPressed: () => _generatePassword(_controllerMasterPassword.text),
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
