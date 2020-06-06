class TextUtils {
  static bool isEmpty(String value) {
    return value == null || value == "";
  }

  static String getNonStr(String value, {String ifNonReplace}) {
    return isEmpty(value) ? (ifNonReplace == null ? "" : ifNonReplace) : value;
  }

  static String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }
}