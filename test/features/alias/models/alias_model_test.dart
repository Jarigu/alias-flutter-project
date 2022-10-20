import 'package:alias_app/features/alias/models/alias_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const rawExampleAlias = <String, dynamic>{
    'alias': '69367',
    '_links': {
      'self':
          'https://www.youtube.com/watch?v=xUSr_1Rsa-Y&list=RDMM&index=7&ab_channel=RapBangClub',
      'short': 'https://url-shortener-nu.herokuapp.com/short/69367'
    }
  };

  // ignore: prefer_const_declarations
  final exampleAliasModel = const AliasModel(
    id: '69367',
    originalUrl:
        'https://www.youtube.com/watch?v=xUSr_1Rsa-Y&list=RDMM&index=7&ab_channel=RapBangClub',
    shortUrl: 'https://url-shortener-nu.herokuapp.com/short/69367',
  );

  test('can parse data fromJson', () {
    expect(AliasModel.fromMap(rawExampleAlias), exampleAliasModel);
  });

  test('can convert data to toJson', () {
    expect(exampleAliasModel.toMap(), equals(rawExampleAlias));
  });
}
