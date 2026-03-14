import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

part 'account.g.dart';

@Freezed(toJson: false)
abstract class Account with _$Account {
  const factory Account({required String id, required String email, required bool verified}) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}
