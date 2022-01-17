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
      title: 'Password Generator',
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
  List<String> websites = ["web.de", "google.com", "discord.com", "a", "b", "c"];

  void _redraw() {
    setState(() {});
  }

  String _generatePassword(String masterPW, String website) {
    return Crypt.sha256(website, salt: _controllerMasterPassword.text).hash.substring(0, 10);
  }

  @override
  void initState() {
    super.initState();
    _controllerMasterPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Button hinzufügen für neue Websites
        // TODO: Möglichkeit zum löschen von Websites
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Website',
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
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
            ElevatedButton(
              // übergeben von Funktion mit Parameter
              onPressed: _redraw,
              child: const Text('Generate Password'),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: websites.length,
              itemBuilder: (context, index) {
                return PasswordCard(
                  password: _generatePassword(_controllerMasterPassword.text, websites[index]),
                  website: websites[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
