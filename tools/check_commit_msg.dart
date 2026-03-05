import 'dart:io';

const _types = ['feat', 'fix', 'docs', 'style', 'refactor', 'perf', 'test', 'chore', 'ci', 'build', 'revert'];

// Matches:  type(scope)!: description
//           type!: description
//           type(scope): description
//           type: description
final _pattern = RegExp(r'^(' + _types.join('|') + r')(\(.+\))?(!)?: .+$', multiLine: true);

void main(List<String> args) {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart tool/check_commit_msg.dart <commit-msg-file>');
    exit(2);
  }

  final file = File(args[0]);
  if (!file.existsSync()) {
    stderr.writeln('Commit message file not found: ${args[0]}');
    exit(2);
  }

  // Strip comments (lines starting with #) and trim whitespace.
  final message = file.readAsLinesSync().where((line) => !line.startsWith('#')).join('\n').trim();

  if (_pattern.hasMatch(message)) {
    exit(0);
  }

  stderr.writeln('''

  Commit message does not follow Conventional Commits format.

  Expected format:  type(scope): description
                    type: description

  Allowed types:    ${_types.join(', ')}

  Breaking change:  append ! before the colon  (e.g. feat!: remove API)

  Your message:     $message
''');
  exit(1);
}
