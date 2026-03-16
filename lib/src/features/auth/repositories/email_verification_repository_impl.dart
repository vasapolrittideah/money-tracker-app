part of 'email_verification_repository.dart';

@riverpod
EmailVerificationRepository emailVerificationRepository(Ref ref) =>
    EmailVerificationRepositoryImpl(ref.watch(apiClientProvider));

class EmailVerificationRepositoryImpl extends BaseRepository implements EmailVerificationRepository {
  EmailVerificationRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<Result<void>> sendVerificationEmail() => execute(() => _client.dio.post('/auth/email/send-verification'));

  @override
  Future<Result<void>> verifyEmail(VerifyEmail request) =>
      execute(() => _client.dio.post('/auth/email/verify', data: request.toJson()));
}
