import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

// Runs lib/roster.dart the way `dart run lib/roster.dart` does, types a
// roster of three characters into it, and checks what main() prints.
Future<ProcessResult> runProgram(String path, String input) async {
  final process = await Process.start(Platform.resolvedExecutable, ['run', path]);
  process.stdin.write(input);
  await process.stdin.close();
  final out = process.stdout.transform(utf8.decoder).join();
  final err = process.stderr.transform(utf8.decoder).join();
  final code = await process.exitCode.timeout(const Duration(seconds: 90));
  return ProcessResult(process.pid, code, await out, await err);
}

void main() {
  group('main() in lib/roster.dart', () {
    test('lib/roster.dart exists and declares main()', () {
      final file = File('lib/roster.dart');
      expect(file.existsSync(), isTrue, reason: 'Keep your program in lib/roster.dart.');
      expect(file.readAsStringSync(), matches(RegExp(r'\bmain\s*\(')),
          reason: 'lib/roster.dart needs a main() function so `dart run` can start it.');
    });

    test('runs without error, survives a missing bio and summarizes the roster', () async {
      // Three characters; Kageyama has no bio (an empty line).
      // volleyball is shared by two, so it is the top interest. One bio is missing.
      const input = '3\n'
          'Hinata\n17\nvolleyball,food\nWants to fly\n'
          'Kageyama\n18\nVolleyball,milk\n\n'
          'Light\n18\nchess\nTop student\n';
      final result = await runProgram('lib/roster.dart', input);
      expect(result.exitCode, equals(0),
          reason: '`dart run lib/roster.dart` must finish without an error, even for a missing bio.\n${result.stderr}');
      final output = result.stdout as String;
      expect(output, contains('No bio yet'), reason: 'Print No bio yet for a character without a bio.');
      expect(output.toLowerCase(), contains('volleyball'), reason: 'Print the top interest.');
      final lastLine = output.trim().split('\n').last;
      expect(lastLine, matches(RegExp(r'\b1\b')),
          reason: 'End by printing how many bios are missing.');
    }, timeout: const Timeout(Duration(minutes: 2)));
  });
}
