import 'package:alias_app/features/alias/enums/alias_status.dart';
import 'package:alias_app/features/alias/logic/alias_state.dart';
import 'package:alias_app/features/alias/models/alias_model.dart';
import 'package:alias_app/features/alias/repositories/alias_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AliasNotifier extends StateNotifier<AliasState> {
  AliasNotifier({required AliasRepository aliasRepository})
      : _aliasRepository = aliasRepository,
        super(
          AliasState.initial(),
        );

  final AliasRepository _aliasRepository;

  Future<void> create(String originalUrl) async {
    state = state.copyWith(status: AliasStatus.loading);

    try {
      final AliasModel alias =
          await _aliasRepository.createAlias(originalUrl: originalUrl);

      state = state.copyWith(
        status: AliasStatus.loaded,
        aliases: [
          alias,
          ...state.aliases,
        ],
      );
    } catch (e) {
      state = state.copyWith(status: AliasStatus.exception);
    }
  }
}
