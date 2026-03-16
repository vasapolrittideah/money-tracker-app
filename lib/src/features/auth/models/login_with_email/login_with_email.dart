import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_with_email.g.dart';

@JsonSerializable(createFactory: false)
class LoginWithEmail extends Equatable {
  const LoginWithEmail({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LoginWithEmailToJson(this);

  LoginWithEmail copyWith({String? email, String? password}) {
    return LoginWithEmail(email: email ?? this.email, password: password ?? this.password);
  }

  @override
  List<Object?> get props => [email, password];
}
