import 'package:alias_app/features/alias/enums/alias_status.dart';
import 'package:alias_app/features/alias/logic/alias_state_notifier.dart';
import 'package:alias_app/features/alias/models/alias_model.dart';
import 'package:alias_app/features/alias/logic/alias_state.dart';
import 'package:alias_app/features/alias/repositories/alias_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aliasProvider = StateNotifierProvider<AliasNotifier, AliasState>((ref) {
  return AliasNotifier(aliasRepository: ref.watch(aliasRepositoryProvider));
});

final aliasesProvider =
    Provider<List<AliasModel>>(((ref) => ref.watch(aliasProvider).aliases));

final aliasStatusProvider =
    Provider<AliasStatus>((ref) => ref.watch(aliasProvider).status);
