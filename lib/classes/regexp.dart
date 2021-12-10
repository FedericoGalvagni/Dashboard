abstract class RegExpCustom {
  static String nomeFile(String percorsoFile) {
    var regex = RegExp(r'([^\\]*$)');
    var match = regex.firstMatch(percorsoFile);
    return match!.group(match.groupCount) ?? "";
  }

  static String percorsoFile(String percorsoFile) {
    var regex = RegExp(r'(.*[\\])');
    var match = regex.firstMatch(percorsoFile);
    String str = match!.group(match.groupCount) ?? "";
    if (str != null && str.length > 0) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  static String lastMatch(String stringa, String pattern) {
    var regex = RegExp(pattern);
    var match = regex.firstMatch(stringa);

    return match!.group(match.groupCount) ?? "";
  }
}
