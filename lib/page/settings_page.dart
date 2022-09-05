import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sharedpref_sample/provider/theme_provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('Application'),
              tiles: [
                SettingsTile.switchTile(
                  title: const Text('Dark mode'),
                  leading: const Icon(Icons.dark_mode),
                  description: ref.watch(isDarkProvider)
                      ? const Text('Dark mode enabled')
                      : const Text('Dark mode disabled'),
                  initialValue: ref.watch(isDarkProvider),
                  onToggle: (_) {
                    ref.read(isDarkProvider.notifier).toggleTheme();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
