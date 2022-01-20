import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  late TextEditingController _controllerWebsite;
  final List<String> _websites = ["web.de", "google.com", "discord.com"];

  void _redraw() {
    setState(() {});
  }

  void _addWebsite() {
    Navigator.of(context).pop();
    setState(() {
      _websites.add(_controllerWebsite.text);
      _controllerWebsite.text = "";
    });
  }

  Future _openNewWebsiteDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add Website"),
          content: TextField(
            controller: _controllerWebsite,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Enter your website",
            ),
          ),
          actions: [
            TextButton(
              onPressed: _addWebsite,
              child: const Text("SUBMIT"),
            )
          ],
        ),
      );

  Future _openChangeWebsiteDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Change Website"),
          content: TextField(
            controller: _controllerWebsite,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Enter modified website",
            ),
          ),
          actions: [
            TextButton(
              //TODO: Create Mehtode to change password
              onPressed: null,
              child: const Text("SUBMIT"),
            )
          ],
        ),
      );

  String _generatePassword(String masterPW, String website) {
    return Crypt.sha256(website, salt: _controllerMasterPassword.text).hash.substring(0, 10);
  }

  @override
  void initState() {
    super.initState();
    _controllerMasterPassword = TextEditingController();
    _controllerWebsite = TextEditingController();
  }

//TODO: Add settings page (TabView)
//TODO:Speicheredaten
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Möglichkeit zum löschen von Websites
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Website',
            onPressed: () {
              _openNewWebsiteDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _websites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_websites[index]),
                  subtitle: Text(_generatePassword(_controllerMasterPassword.text, _websites[index])),
                  trailing: const Icon(Icons.alternate_email),
                  onLongPress: () {
                    _openChangeWebsiteDialog();
                  },
                  onTap: () => {
                    Clipboard.setData(
                      ClipboardData(text: _generatePassword(_controllerMasterPassword.text, _websites[index])),
                    ),
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password copied')))
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
