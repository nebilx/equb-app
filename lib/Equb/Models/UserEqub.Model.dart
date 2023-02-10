import 'dart:convert';

import 'package:collection/collection.dart';

class UserEqubModeL {
  String title;
  String description;
  String amount;
  String memberSize;
  List<dynamic>? members;
  List<dynamic>? roundMembers;
  String? winner;
  UserEqubModeL({
    required this.title,
    required this.description,
    required this.amount,
    required this.memberSize,
    this.members,
    this.roundMembers,
    this.winner,
  });
  

  UserEqubModeL copyWith({
    String? title,
    String? description,
    String? amount,
    String? memberSize,
    List<dynamic>? members,
    List<dynamic>? roundMembers,
    String? winner,
  }) {
    return UserEqubModeL(
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      memberSize: memberSize ?? this.memberSize,
      members: members ?? this.members,
      roundMembers: roundMembers ?? this.roundMembers,
      winner: winner ?? this.winner,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'amount': amount});
    result.addAll({'memberSize': memberSize});
    if(members != null){
      result.addAll({'members': members});
    }
    if(roundMembers != null){
      result.addAll({'roundMembers': roundMembers});
    }
    if(winner != null){
      result.addAll({'winner': winner});
    }
  
    return result;
  }

  factory UserEqubModeL.fromMap(Map<String, dynamic> map) {
    return UserEqubModeL(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      amount: map['amount'] ?? '',
      memberSize: map['memberSize'] ?? '',
      members: List<dynamic>.from(map['members']),
      roundMembers: List<dynamic>.from(map['roundMembers']),
      winner: map['winner'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEqubModeL.fromJson(String source) => UserEqubModeL.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEqubModeL(title: $title, description: $description, amount: $amount, memberSize: $memberSize, members: $members, roundMembers: $roundMembers, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is UserEqubModeL &&
      other.title == title &&
      other.description == description &&
      other.amount == amount &&
      other.memberSize == memberSize &&
      listEquals(other.members, members) &&
      listEquals(other.roundMembers, roundMembers) &&
      other.winner == winner;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      amount.hashCode ^
      memberSize.hashCode ^
      members.hashCode ^
      roundMembers.hashCode ^
      winner.hashCode;
  }
}
