import 'package:equatable/equatable.dart';

class LoginWithEmail extends Equatable {
  const LoginWithEmail({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  LoginWithEmail copyWith({String? email, String? password}) {
    return LoginWithEmail(email: email ?? this.email, password: password ?? this.password);
  }

  @override
  List<Object?> get props => [email, password];
}
