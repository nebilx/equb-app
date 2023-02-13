import 'dart:convert';

import 'package:collection/collection.dart';

class EqubModeL {
  String? id;
  String title;
  String description;
  String amount;
  String memberSize;
  List<dynamic>? members;
  List<dynamic>? roundMembers;
  List<dynamic>? winners;
  EqubModeL({
    required this.title,
    required this.description,
    required this.amount,
    required this.memberSize,
    this.members,
    this.id,
    this.roundMembers,
    this.winners,
  });

  EqubModeL copyWith({
    String? title,
    String? description,
    String? amount,
    String? memberSize,
    List<dynamic>? members,
    List<dynamic>? roundMembers,
    String? winnerssssss,
  }) {
    return EqubModeL(
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      memberSize: memberSize ?? this.memberSize,
      members: members ?? this.members,
      roundMembers: roundMembers ?? this.roundMembers,
      winners: winners ?? this.winners,
    );
  }

  Map<String, dynamic> toMap(EqubModeL equbModeL) {
    final result = <String, dynamic>{};

    result.addAll({'title': equbModeL.title});
    result.addAll({'description': equbModeL.description});
    result.addAll({'amount': equbModeL.amount});
    result.addAll({'memberSize': equbModeL.memberSize});
    if (members != null) {
      result.addAll({'members': equbModeL.members});
    }
    if (roundMembers != null) {
      result.addAll({'roundMembers': equbModeL.roundMembers});
    }
    if (winners != null) {
      result.addAll({'winners': equbModeL.winners});
    }

    return result;
  }

  factory EqubModeL.fromMap(Map<String, dynamic> map) {
    return EqubModeL(
        title: map['title'] ?? '',
      description: map['description'] ?? '',
      amount: map['amount'] ?? '',
      memberSize: map['memberSize'] ?? '',
      members: List<dynamic>.from(map['members']),
      roundMembers: List<dynamic>.from(map['roundMembers']),
      winners: map['winners'],
    );
  }

  //String toJson() => json.encode(toMap(EqubModeL equbModel));

  factory EqubModeL.fromJson(String source) =>
      EqubModeL.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEqubModeL(title: $title, description: $description, amount: $amount, memberSize: $memberSize, members: $members, roundMembers: $roundMembers, winnersssssss: $winners)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is EqubModeL &&
        other.title == title &&
        other.description == description &&
        other.amount == amount &&
        other.memberSize == memberSize &&
        listEquals(other.members, members) &&
        listEquals(other.roundMembers, roundMembers) &&
        other.winners == winners;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        memberSize.hashCode ^
        members.hashCode ^
        roundMembers.hashCode ^
        winners.hashCode;
  }
}
