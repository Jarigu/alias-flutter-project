import 'package:alias_app/features/alias/models/alias_model.dart';

class DummyAlias {
  static Map<String, dynamic> rawAlias1 = <String, dynamic>{
    'alias': '69367',
    '_links': {
      'self':
          'https://www.youtube.com/watch?v=xUSr_1Rsa-Y&list=RDMM&index=7&ab_channel=RapBangClub',
      'short': 'https://url-shortener-nu.herokuapp.com/short/69367'
    }
  };

  static AliasModel exampleAliasModel = const AliasModel(
    id: '69367',
    originalUrl:
        'https://www.youtube.com/watch?v=xUSr_1Rsa-Y&list=RDMM&index=7&ab_channel=RapBangClub',
    shortUrl: 'https://url-shortener-nu.herokuapp.com/short/69367',
  );

  static AliasModel aliasModel1 = AliasModel.fromMap(rawAlias1);
}
