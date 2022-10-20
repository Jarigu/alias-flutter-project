import 'package:equatable/equatable.dart';

class Alias extends Equatable {
  const Alias({
    required this.id,
    required this.originalUrl,
    required this.shortUrl,
  });

  final String id;
  final String originalUrl;
  final String shortUrl;

  @override
  List<Object> get props => [id, originalUrl, shortUrl];
}
