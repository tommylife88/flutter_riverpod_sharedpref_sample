import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sharedpref_sample/navigator.dart';

final counterProvider = StateProvider((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
        actions: <Widget>[
          IconButton(
            onPressed: () => AppNavigator().navToSettingsPage(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        child: Consumer(
          builder: (context, ref, _) {
            final count = ref.watch(counterProvider.state).state;
            return Text('$count');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
