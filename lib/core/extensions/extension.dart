//Make Extension for date to format
import 'package:intl/intl.dart';

extension DateExtension on DateTime? {
  String get formattedDate {
    if (this == null) return '';
    return DateFormat('MMMM d, yyyy').format(this!);
  }
}
