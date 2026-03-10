import 'dart:convert';

import 'package:money_tracker/src/core/session/session_storage.dart';
import 'package:money_tracker/src/core/session/session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_notifier.g.dart';

@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  static const sessionKey = 'session';

  @override
  Future<Session?> build() async {
    final json = await ref.read(secureStorageProvider).read(key: sessionKey);
    return json != null ? Session.fromJson(jsonDecode(json)) : null;
  }

  Future<void> saveSession(Session session) async {
    await ref.read(secureStorageProvider).write(key: sessionKey, value: jsonEncode(session.toJson()));
    state = AsyncData(session);
  }

  Future<void> clearSession() async {
    await ref.read(secureStorageProvider).delete(key: sessionKey);
    state = const AsyncData(null);
  }
}
