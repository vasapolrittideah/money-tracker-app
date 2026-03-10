import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_email.freezed.dart';

part 'login_with_email.g.dart';

@Freezed(toJson: true)
abstract class LoginWithEmail with _$LoginWithEmail {
  const factory LoginWithEmail({required String email, required String password}) = _LoginWithEmail;
}
