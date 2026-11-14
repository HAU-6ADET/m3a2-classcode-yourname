# M3A2: Kilig: Character Roster

**Kind:** take-home practice. Do it on your own time before the next meeting. Searching, AI and helping each other are allowed, because this is practice; record what you used in `SOURCES-AND-ASSISTANCE.md`. The lab exam is closed book, so make sure you understand every line you submit.

**Kilig** now keeps a roster of character profiles. The demo looked contacts up and filtered them; this take-home **summarizes** the roster, and some profiles have no bio yet, so your program must not crash on them. It is syllabus Lab 3.

## Before you start

Follow the [setup guide](SETUP.md) to create and clone your private repository, exactly as in M1A0. The repository is named `m3a2-CLASSCODE-USERNAME`.

## What to build

Pick anime characters you like, from any series. In `lib/roster.dart`, write these functions, which the tests call directly:

- `Map<String, int> countInterests(Map<String, Set<String>> interests)`: for each interest, how many characters have it, ignoring capital letters. The keys of the result are in lowercase.
- `String topInterest(Map<String, int> counts)`: the interest with the highest count. On a tie, return the one that comes first from A to Z. Return an empty string when there are no interests.
- `double averageAge(Map<String, int> ages)`: the average age, or 0 for an empty roster.
- `List<String> missingBios(Map<String, String?> bios)`: the names whose bio is `null` or blank, sorted A to Z.
- `String bioPreview(String? bio)`: `No bio yet` when the bio is `null` or blank, the bio itself when it has 20 characters or fewer, and otherwise its first 20 characters followed by `...`.

`main()` in `lib/roster.dart` asks how many characters to add, then reads each character's name, age, comma-separated interests and bio, one per line and in that order. An empty bio line means the character has no bio yet. It then prints every character with their age and bio preview, the top interest, the average age, and, as the last line, how many bios are missing.

Run your program with:

```sh
dart run lib/roster.dart
```

## Concepts to research

- Counting with a Map: adding 1 to a value that may not be there yet.
- Why interests suit a Set better than a List.
- Finding the largest entry with `reduce`, and breaking a tie.
- Treating a missing bio without using `!` blindly.

## How it is graded

10 test points for correctness: the functions are tested with edge cases such as an empty roster, a tie, a blank bio and a long bio, and the tests also run `lib/roster.dart` with a character that has no bio and check that it finishes without an error. 10 rubric points for logical design (10, 7, 4 or 1).

Every activity also checks `student.json`: fill in your full name, student number, school email, class code, GitHub username, `room` and `pcNumber`, all as text.

## Check and save your work

```sh
dart analyze
dart test
```

The tests in your repository are a guide. The instructor grades from the course's own copy of the tests, so do not edit the tests to make them pass.

```sh
git status
git add lib/ student.json SOURCES-AND-ASSISTANCE.md
git commit -m "Complete M3A2"
```

In VS Code, open **Source Control** and choose **Push**, then check that the commit appears on GitHub.

## Submit the exact commit link in Canvas

Open your repository's commit history on GitHub, open the commit with your finished work, copy its full URL (it contains **/commit/**), and submit it in the Canvas assignment for M3A2 using the Website URL option. Submit the commit page, not the repository home page or a screenshot.
