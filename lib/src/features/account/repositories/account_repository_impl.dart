part of 'account_repository.dart';

@riverpod
AccountRepository accountRepository(Ref ref) => AccountRepositoryImpl(ref.watch(apiClientProvider));

class AccountRepositoryImpl extends BaseRepository implements AccountRepository {
  AccountRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<Result<Account>> getCurrentAccount() =>
      execute(() => _client.dio.get('/account/me'), fromJson: Account.fromJson);

  @override
  Future<Result<void>> deleteAccount() => execute(() => _client.dio.delete('/account/delete'));
}
