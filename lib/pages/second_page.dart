import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/counter_provider.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Second page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Same counter: $count', style: TextStyle(fontSize: 24)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: Text('Add'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state = 0;
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
