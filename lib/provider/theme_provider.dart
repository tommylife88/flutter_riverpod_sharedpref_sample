import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared_utility_provider.dart';

/// ダークテーマ設定のプロバイダ
///
/// [DarkThemeNotifier] のインスタンスを値に持つ [StateNotifierProvider] を作成し、
/// UI 側からダークテーマ設定を操作することを可能にする。
final isDarkProvider = StateNotifierProvider<DarkThemeNotifier, bool>((ref) {
  return DarkThemeNotifier(ref: ref);
});

/// ダークテーマ設定のステート管理クラス
///
/// [StateNotifierProvider] に渡すことになる [StateNotifier] クラスとして実装する。
/// このクラスではステートを [state] を介して UI 側に通知する。
/// つまり、 [state] に関しては public なゲッターやプロパティは作らないということ。
/// public メソッドを通じて UI 側にステートの操作を許可する。
class DarkThemeNotifier extends StateNotifier<bool> {
  DarkThemeNotifier({required this.ref}) : super(true) {
    state = ref.watch(sharedUtilityProvider).isDarkModeEnabled();
  }
  Ref ref;

  void toggleTheme() {
    ref.watch(sharedUtilityProvider).setDarkModeEnabled(
          isdark: !ref.watch(sharedUtilityProvider).isDarkModeEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isDarkModeEnabled();
  }
}
