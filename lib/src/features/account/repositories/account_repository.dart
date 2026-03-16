import 'package:money_tracker/src/core/bases/base_repository.dart';
import 'package:money_tracker/src/core/errors/result.dart';
import 'package:money_tracker/src/core/network/api_client.dart';
import 'package:money_tracker/src/features/account/models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_repository_impl.dart';
part 'account_repository.g.dart';

abstract interface class AccountRepository {
  /// Fetches the current user's account details.
  Future<Result<Account>> getCurrentAccount();

  Future<Result<void>> deleteAccount();
}
