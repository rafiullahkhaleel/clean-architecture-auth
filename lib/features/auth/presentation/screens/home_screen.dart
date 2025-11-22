import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/auth_notifier.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: user == null
          ? Center(child: Text("No user"))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID: ${user.id}"),
                  Text("Name: ${user.name}"),
                  Text("Email: ${user.email}"),
                ],
              ),
            ),
    );
  }
}
