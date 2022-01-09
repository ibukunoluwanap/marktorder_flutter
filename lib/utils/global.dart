firstUpper(String chars) {
  for (var char = 0; char < chars.length; char++) {
    return char == 0
        ? "${chars[char].toUpperCase()}${chars.substring(1)}"
        : null;
  }
}
