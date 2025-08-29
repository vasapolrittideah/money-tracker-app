import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:core/src/consts/hive_type_id.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'session_model.g.dart';

@CopyWith()
@HiveType(typeId: HiveTypeId.session)
class SessionModel extends Equatable {
  const SessionModel({
    required this.tokenType,
    required this.accessToken,
    required this.accessTokenExpiresAt,
    required this.refreshToken,
    required this.refreshTokenExpiresAt,
  });

  @HiveField(0)
  final String tokenType;

  @HiveField(1)
  final String accessToken;

  @HiveField(2)
  final DateTime accessTokenExpiresAt;

  @HiveField(3)
  final String refreshToken;

  @HiveField(4)
  final DateTime refreshTokenExpiresAt;

  @override
  List<Object?> get props => [tokenType, accessToken, accessTokenExpiresAt, refreshToken, refreshTokenExpiresAt];
}
