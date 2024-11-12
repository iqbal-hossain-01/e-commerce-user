import 'package:cloud_firestore/cloud_firestore.dart';

class DateModel {
  int day;
  int month;
  int year;
  Timestamp timestamp;

  DateModel({
    required this.day,
    required this.month,
    required this.year,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'month': month,
      'year': year,
      'timestamp': timestamp,
    };
  }

  factory DateModel.fromMap(Map<String, dynamic> map) {
    return DateModel(
      day: map['day'] as int,
      month: map['month'] as int,
      year: map['year'] as int,
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}