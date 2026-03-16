import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session extends Equatable {
  const Session({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  Session copyWith({String? accessToken, String? refreshToken}) {
    return Session(accessToken: accessToken ?? this.accessToken, refreshToken: refreshToken ?? this.refreshToken);
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
