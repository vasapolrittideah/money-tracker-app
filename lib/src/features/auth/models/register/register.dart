import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable(createFactory: false)
class Register extends Equatable {
  const Register({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$RegisterToJson(this);

  Register copyWith({String? email, String? password}) {
    return Register(email: email ?? this.email, password: password ?? this.password);
  }

  @override
  List<Object?> get props => [email, password];
}
