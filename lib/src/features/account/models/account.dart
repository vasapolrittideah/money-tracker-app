import 'package:equatable/equatable.dart';

class Account extends Equatable {
  const Account({required this.id, required this.email, required this.verified});

  final String id;
  final String email;
  final bool verified;

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(id: json['id'], email: json['email'], verified: json['verified']);
  }

  Account copyWith({String? id, String? email, bool? verified}) {
    return Account(id: id ?? this.id, email: email ?? this.email, verified: verified ?? this.verified);
  }

  @override
  List<Object?> get props => [id, email, verified];
}
