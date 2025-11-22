import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/auth_notifier.dart';

class SignupScreen extends ConsumerWidget {
  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(controller: name, decoration: InputDecoration(labelText: "Name")),
          TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: pass, decoration: InputDecoration(labelText: "Password")),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await ref.read(authProvider.notifier).signup(name.text, email.text, pass.text);
              Navigator.pushReplacementNamed(context, "/home");
            },
            child: Text("Create Account"),
          ),
        ]),
      ),
    );
  }
}
