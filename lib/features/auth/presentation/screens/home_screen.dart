import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).loadCurrentUser();
            },
          ),
        ],
      ),
      body: authState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : authState.user != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Details:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${authState.user!.id}'),
                    const SizedBox(height: 8),
                    Text('Name: ${authState.user!.name}'),
                    const SizedBox(height: 8),
                    Text('Email: ${authState.user!.email}'),
                    const SizedBox(height: 8),
                    Text(
                      'Created: ${authState.user!.createdAt.toString().split('.')[0]}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
          : const Center(child: Text('No user data')),
    );
  }
}