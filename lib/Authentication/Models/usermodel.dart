import 'dart:convert';
import 'dart:io';

class User {
  String username;
  String phonenumber;
  String fullname;
  String password;
  File? image;
  String? imageUrl;
  User({
    required this.username,
    required this.phonenumber,
    required this.fullname,
    required this.password,
    this.image,
    this.imageUrl,
  });
  

  

  User copyWith({
    String? username,
    String? phonenumber,
    String? fullname,
    String? password,
    File? image,
    String? imageUrl,
  }) {
    return User(
      username: username ?? this.username,
      phonenumber: phonenumber ?? this.phonenumber,
      fullname: fullname ?? this.fullname,
      password: password ?? this.password,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      fullname: map['fullname'] ?? '',
      password: map['password'] ?? '',
  
      imageUrl: map['imageUrl'],
    );
  }

 

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(username: $username, phonenumber: $phonenumber, fullname: $fullname, password: $password, image: $image, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.username == username &&
      other.phonenumber == phonenumber &&
      other.fullname == fullname &&
      other.password == password &&
      other.image == image &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      phonenumber.hashCode ^
      fullname.hashCode ^
      password.hashCode ^
      image.hashCode ^
      imageUrl.hashCode;
  }
}
