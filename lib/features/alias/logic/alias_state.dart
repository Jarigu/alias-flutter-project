import 'package:alias_app/features/alias/enums/alias_status.dart';
import 'package:equatable/equatable.dart';
import 'package:alias_app/features/alias/models/alias_model.dart';

class AliasState extends Equatable {
  final AliasStatus status;
  final List<AliasModel> aliases;

  const AliasState({
    required this.status,
    required this.aliases,
  });

  factory AliasState.initial() {
    return const AliasState(status: AliasStatus.none, aliases: []);
  }

  AliasState copyWith({
    AliasStatus? status,
    List<AliasModel>? aliases,
  }) {
    return AliasState(
      status: status ?? this.status,
      aliases: aliases ?? this.aliases,
    );
  }

  @override
  List<Object> get props => [status, aliases];
}
