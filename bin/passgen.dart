// Module 3 – Activity 2 – Password Generator
//
// Generate a random password whose length depends on a chosen strength.
// A password may contain a mix of lowercase letters, uppercase letters,
// numbers, and the symbols  ! @ # % ^ & *  . Every generated password must be
// random - asking again gives a new one.
//
// Write TWO functions (keep these exact names):
//
//   String shuffleGenerator(int length)
//       - returns a random sequence of `length` characters from the allowed set
//
//   String passwordGenerator(String strength)
//       - calls shuffleGenerator with the right length:
//             "weak"   -> 8 characters
//             "medium" -> 15 characters
//             "strong" -> 25 characters
//       - for any OTHER input, inform the user of the valid options and
//         return an empty string ('')
//
// Save this file as passgen.dart (it already is).
//
// Concepts to research (see the Module 3 "Functions & Randomness" cheat sheet:
// content/cheat-sheets/dart-m3-functions-and-random.md): dart:math `Random`,
// building a random string from a character set, functions, and branching.
//
// The skeleton compiles. Fill in the TODOs; do not rename the functions.

import 'dart:math';

// TODO: define the set of allowed characters
// (uppercase + lowercase + digits + the symbols ! @ # % ^ & *).

String shuffleGenerator(int length) {
  // TODO: build and return a random string of `length` characters,
  // each picked from the allowed set.
  return '';
}

String passwordGenerator(String strength) {
  // TODO: map "weak"/"medium"/"strong" to 8/15/25 and call shuffleGenerator.
  // For anything else, tell the user the valid options and return ''.
  return '';
}

void main() {
  // TODO: ask the user for a strength (weak / medium / strong),
  // then print passwordGenerator(strength).
}
