import 'package:alias_app/core/services/http/http_service.dart';
import 'package:alias_app/features/alias/models/alias_model.dart';
import 'package:alias_app/features/alias/repositories/alias_repository.dart';

class HttpAliasrepository implements AliasRepository {
  ///Create a new instance of [HttpAliasRepository]
  HttpAliasrepository(this.httpService);

  /// Http service used to access an Http client and make calls
  final HttpService httpService;

  @override
  String get path => '/api/alias';

  @override
  Future<AliasModel> createAlias({
    required String originalUrl,
  }) async {
    final Map<String, dynamic> data = {
      'url': originalUrl,
    };
    final responseData = await httpService.post(path, data: data);

    return AliasModel.fromMap(responseData);
  }
}
