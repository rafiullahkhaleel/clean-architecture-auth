import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/auth_notifier.dart';

class LoginScreen extends ConsumerWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: pass, decoration: InputDecoration(labelText: "Password")),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await ref.read(authProvider.notifier).login(email.text, pass.text);
              Navigator.pushReplacementNamed(context, "/home");
            },
            child: Text("Login"),
          ),
          ElevatedButton(
            onPressed: ()  {
              Navigator.pushReplacementNamed(context, "/signup");
            },
            child: Text("Login"),
          ),
        ]),
      ),
    );
  }
}
