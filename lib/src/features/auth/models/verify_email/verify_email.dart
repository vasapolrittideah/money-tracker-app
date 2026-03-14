import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email.freezed.dart';

part 'verify_email.g.dart';

@Freezed(toJson: true)
abstract class VerifyEmail with _$VerifyEmail {
  const factory VerifyEmail({required String accountId, required String token}) = _VerifyEmail;
}
