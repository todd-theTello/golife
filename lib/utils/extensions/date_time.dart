///
extension on DateTime {
  ///
  String get dateTimeToString {
    final String year = '${this.year}';
    final String month = this.month.toString().padLeft(2, '0');
    final String day = this.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
}
