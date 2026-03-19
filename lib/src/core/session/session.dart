import 'package:equatable/equatable.dart';

class Session extends Equatable {
  const Session({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(accessToken: json['access_token'], refreshToken: json['refresh_token']);
  }

  Map<String, dynamic> toJson() {
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }

  Session copyWith({String? accessToken, String? refreshToken}) {
    return Session(accessToken: accessToken ?? this.accessToken, refreshToken: refreshToken ?? this.refreshToken);
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
