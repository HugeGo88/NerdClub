import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordCard extends StatelessWidget {
  const PasswordCard({Key? key, required this.password, required this.website}) : super(key: key);
  final String website;
  final String password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: InkWell(
          onTap: () => {
            Clipboard.setData(
              ClipboardData(text: password),
            ),
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password copied')))
          },
          // TODO: Anstelle von Card ElevatedButton benutzen https://api.flutter.dev/flutter/material/ElevatedButton-class.html oder lösung finden für inkwell
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Website: $website",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Password: $password",
                    style: Theme.of(context).textTheme.subtitle1!,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
