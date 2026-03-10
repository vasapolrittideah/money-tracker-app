import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';

part 'register.g.dart';

@Freezed(toJson: true)
abstract class Register with _$Register {
  const factory Register({required String email, required String password}) = _Register;
}
