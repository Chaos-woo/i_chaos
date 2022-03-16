
extension StringExtension on String {
  bool equals(String? other) {
    if (other == null) {
      return false;
    }

    return compareTo(other) == 0;
  }

  bool equalsIgnore(String? other) {
    if (other == null) {
      return false;
    }

    return toLowerCase().compareTo(other.toLowerCase()) == 0;
  }
}