import 'dart:convert';
import 'dart:io';

import 'package:m3a2/roster.dart';
import 'package:test/test.dart';

void main() {
  group('countInterests', () {
    test('counts how many characters share each interest', () {
      final counts = countInterests({
        'Hinata': {'volleyball', 'food'},
        'Kageyama': {'volleyball', 'milk'},
      });
      expect(counts, equals({'volleyball': 2, 'food': 1, 'milk': 1}));
    });
    test('ignores capital letters', () {
      expect(countInterests({'A': {'Music'}, 'B': {'music'}}), equals({'music': 2}));
    });
    test('an empty roster gives an empty map', () => expect(countInterests({}), isEmpty));
  });

  group('topInterest', () {
    test('returns the most shared interest', () => expect(topInterest({'chess': 1, 'food': 3, 'art': 2}), equals('food')));
    test('a tie goes to the name first in A to Z order', () => expect(topInterest({'music': 2, 'anime': 2}), equals('anime')));
    test('no interests at all is an empty string', () => expect(topInterest({}), equals('')));
  });

  group('averageAge', () {
    test('averages the ages', () => expect(averageAge({'A': 17, 'B': 20}), equals(18.5)));
    test('an empty roster is 0, not a crash', () => expect(averageAge({}), equals(0)));
  });

  group('missingBios', () {
    test('lists characters with no bio or a blank one, sorted', () {
      expect(missingBios({'L': null, 'Light': 'Top student', 'Asuna': '  '}), equals(['Asuna', 'L']));
    });
  });

  group('bioPreview', () {
    test('a missing bio reads "No bio yet"', () => expect(bioPreview(null), equals('No bio yet')));
    test('a blank bio reads "No bio yet"', () => expect(bioPreview('   '), equals('No bio yet')));
    test('a short bio is unchanged', () => expect(bioPreview('Loves milk'), equals('Loves milk')));
    test('a long bio keeps 20 characters and adds ...', () {
      expect(bioPreview('Setter who wants to be the best in Japan'), equals('Setter who wants to ...'));
    });
  });

  group("Student details in your private activity copy", () {
    late Map<String, dynamic> info;
    setUpAll(() {
      info = jsonDecode(File("student.json").readAsStringSync()) as Map<String, dynamic>;
    });
    for (final field in ["fullName", "studentNumber", "studentEmail", "classCode", "githubAccount", "room", "pcNumber"]) {
      test("$field is filled in", () {
        final value = info[field];
        expect(value, isA<String>(), reason: "Set $field in student.json.");
        expect((value as String).trim(), isNotEmpty, reason: "Set $field in your private copy of student.json.");
      });
    }
    test("classCode identifies one of the new ADET classes", () {
      expect(info["classCode"], isIn(["2223", "2293", "2182", "2294"]), reason: "Use the class code shown in your own Canvas course.");
    });
  });
}
