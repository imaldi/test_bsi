import 'dart:io';

main() {
  print("Enter input data:");
  String? input = stdin.readLineSync();
  List<String> clearedInput =
      input?.replaceAll(" ", "").split("").toList() ?? [];

  var currentLetter = "";
  var currentLetterCount = 0;
  List<(String, int)> letterAndCountPair = [];

  // fixme huruf terakhir ga keitung.
  for (var i = 0; i < clearedInput.length; i++) {
    if (currentLetter.isNotEmpty && currentLetter != clearedInput[i]) {
      letterAndCountPair.add((currentLetter, currentLetterCount));
      currentLetterCount = 0;
    }
    currentLetter = clearedInput[i];
    currentLetterCount = currentLetterCount + 1;
  }

  // tambahkan huruf terakhir dan total nya ke dalam output
  if (currentLetter.isNotEmpty) {
    letterAndCountPair.add((currentLetter, currentLetterCount));
  }

  print("Output:");
  for (var pair in letterAndCountPair) {
    print("${pair.$1} = ${pair.$2}");
  }
}
