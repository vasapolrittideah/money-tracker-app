part of 'auth_repository.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(ref.watch(apiClientProvider));

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<Result<Session>> register(Register request) =>
      execute(() => _client.dio.post('/auth/register', data: request.toJson()), fromJson: Session.fromJson);

  @override
  Future<Result<Session>> loginWithEmail(LoginWithEmail request) =>
      execute(() => _client.dio.post('/auth/login/email', data: request.toJson()), fromJson: Session.fromJson);

  @override
  Future<Result<void>> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
