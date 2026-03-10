import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({required String accessToken, required String refreshToken}) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}
