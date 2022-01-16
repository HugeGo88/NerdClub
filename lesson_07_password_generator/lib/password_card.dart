import 'package:flutter/material.dart';

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
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Password: $password",
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
