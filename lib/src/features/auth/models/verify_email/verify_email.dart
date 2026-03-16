import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_email.g.dart';

@JsonSerializable(createFactory: false)
class VerifyEmail extends Equatable {
  const VerifyEmail({required this.accountId, required this.token});

  final String accountId;
  final String token;

  Map<String, dynamic> toJson() => _$VerifyEmailToJson(this);

  VerifyEmail copyWith({String? accountId, String? token}) {
    return VerifyEmail(accountId: accountId ?? this.accountId, token: token ?? this.token);
  }

  @override
  List<Object?> get props => [accountId, token];
}
