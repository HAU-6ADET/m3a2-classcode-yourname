import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../bin/passgen.dart';

final _allowed = RegExp(r'^[A-Za-z0-9!@#%^&*]+$');

void main() {
  test('student.json is filled in', () {
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }
  });

  group('Password generator', () {
    test('shuffleGenerator returns a string of the requested length', () {
      expect(shuffleGenerator(8).length, 8);
      expect(shuffleGenerator(20).length, 20);
    });

    test('passwordGenerator uses the right length per strength', () {
      expect(passwordGenerator('weak').length, 8);
      expect(passwordGenerator('medium').length, 15);
      expect(passwordGenerator('strong').length, 25);
    });

    test('an unknown strength returns an empty string', () {
      expect(passwordGenerator('ultra'), '');
      expect(passwordGenerator(''), '');
    });

    test('passwords use only allowed characters and are random', () {
      final a = passwordGenerator('strong');
      final b = passwordGenerator('strong');
      expect(_allowed.hasMatch(a), isTrue,
          reason: 'only letters, digits and ! @ # % ^ & * are allowed');
      expect(a == b, isFalse,
          reason: 'two generated passwords should almost never be identical');
    });
  });
}
