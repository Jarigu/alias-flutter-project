import 'dart:convert';

import 'package:alias_app/features/alias/entities/alias.dart';

class AliasModel extends Alias {
  const AliasModel({
    required String id,
    required String originalUrl,
    required String shortUrl,
  }) : super(
          id: id,
          originalUrl: originalUrl,
          shortUrl: shortUrl,
        );

  Map<String, dynamic> toMap() {
    return {
      'alias': id,
      '_links': {
        'self': originalUrl,
        'short': shortUrl,
      }
    };
  }

  factory AliasModel.fromMap(Map<String, dynamic> map) {
    return AliasModel(
      id: map['alias'] ?? '',
      originalUrl: map['_links']['self'] ?? '',
      shortUrl: map['_links']['short'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AliasModel.fromJson(String source) =>
      AliasModel.fromMap(json.decode(source));
}
