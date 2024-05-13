String timeParse(String time) {
  // Split the time string by ':' to get hours, minutes, and seconds
  List<String> parts = time.split(':');

  // Extract hours, minutes, and seconds
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);
  int seconds = int.parse(parts[2]);

  // Format hours with leading zero if necessary
  String formattedHours = hours >= 1
      ? '0$hours:'
      : hours == 0
          ? ""
          : '$hours:';

  // Format minutes with leading zero if necessary
  String formattedMinutes = minutes < 10
      ? minutes == 0
          ? '0:'
          : '0$minutes:'
      : '$minutes:';

  // Format seconds with leading zero if necessary
  String formattedSeconds = seconds < 10 ? '0$seconds' : '$seconds';

  // Combine formatted components into a time string
  return '$formattedHours$formattedMinutes$formattedSeconds';
}
