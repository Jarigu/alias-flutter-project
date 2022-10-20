import 'package:alias_app/core/services/http/http_service_provider.dart';
import 'package:alias_app/features/alias/models/alias_model.dart';
import 'package:alias_app/features/alias/repositories/http_alias_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider to map [] implementation to
/// [AliasRepository] interface
final aliasRepositoryProvider = Provider<AliasRepository>(
  (ref) {
    final httpService = ref.watch(httpServiceProvider);
    return HttpAliasrepository(httpService);
  },
);

/// Alias repository interface
abstract class AliasRepository {
  String get path;

  Future<AliasModel> createAlias({
    required String originalUrl,
  });
}
