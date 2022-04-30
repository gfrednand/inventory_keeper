import 'package:cloud_firestore/cloud_firestore.dart';

/// Check if number is integer

bool isInteger(num value) => value is int || value == value.roundToDouble();

/// Convert timestamp to datetime
DateTime? parseTime(dynamic date) {
  return date == null ? null : (date as Timestamp).toDate();
}
