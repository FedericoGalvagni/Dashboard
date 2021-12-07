String lastMatch(String stringa, String pattern) {
  var regex = RegExp(pattern);
  var match = regex.firstMatch(stringa);

  return match!.group(match.groupCount) ?? "";
}
