import 'dart:convert';

import 'package:collection/collection.dart';

class MessageModel {
  String title;
  String description;
  String winner;
  int amount;
  String date;
  List<dynamic> participants;
  MessageModel({
    required this.title,
    required this.description,
    required this.winner,
    required this.amount,
    required this.date,
    required this.participants,
  });

  MessageModel copyWith({
    String? title,
    String? description,
    String? winner,
    int? amount,
    String? date,
    List<dynamic>? participants,
  }) {
    return MessageModel(
      title: title ?? this.title,
      description: description ?? this.description,
      winner: winner ?? this.winner,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      participants: participants ?? this.participants,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'winner': winner});
    result.addAll({'amount': amount});
    result.addAll({'date': date});
    result.addAll({'participants': participants});
  
    return result;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      winner: map['winner'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      date: map['date']?.toString() ?? '',
      participants: List<dynamic>.from(map['participants']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageModel(title: $title, description: $description, winner: $winner, amount: $amount, date: $date, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is MessageModel &&
      other.title == title &&
      other.description == description &&
      other.winner == winner &&
      other.amount == amount &&
      other.date == date &&
      listEquals(other.participants, participants);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      winner.hashCode ^
      amount.hashCode ^
      date.hashCode ^
      participants.hashCode;
  }
}
