class TimeFormatter {
  TimeFormatter._();

  static String to12Hour(String time) {
    final cleanTime = time.split(' ').first;

    final parts = cleanTime.split(':');

    if (parts.length < 2) {
      return time;
    }

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) {
      return time;
    }

    final hour12 = hour % 12 == 0 ? 12 : hour % 12;

    return '$hour12:${minute.toString().padLeft(2, '0')}';
  }
}
