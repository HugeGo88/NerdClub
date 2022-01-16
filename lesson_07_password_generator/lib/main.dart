import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:lesson_07_password_generator/password_card.dart';

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
  String _password1 = '';
  String _password2 = '';
  String _password3 = '';

  void _generatePassword(String masterPW) {
    setState(() {
      _password1 = Crypt.sha256("web.de", salt: _controllerMasterPassword.text).hash.substring(0, 10);
      _password2 = Crypt.sha256("google.com", salt: _controllerMasterPassword.text).hash.substring(0, 10);
      _password3 = Crypt.sha256("discord.com", salt: _controllerMasterPassword.text).hash.substring(0, 10);
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
              margin: const EdgeInsets.all(8.0),
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
              margin: const EdgeInsets.all(8.0),
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
              child: const Text('Generate Password'),
            ),
            PasswordCard(
              website: "web.de",
              password: _password1,
            ),
            PasswordCard(
              website: "google.com",
              password: _password2,
            ),
            PasswordCard(
              website: "discord.com",
              password: _password3,
            ),
          ],
        ),
      ),
    );
  }
}
