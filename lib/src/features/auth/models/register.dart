import 'package:equatable/equatable.dart';

class Register extends Equatable {
  const Register({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  Register copyWith({String? email, String? password}) {
    return Register(email: email ?? this.email, password: password ?? this.password);
  }

  @override
  List<Object?> get props => [email, password];
}
