import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Object address;
  final String phone;
  final String website;
  final Object company;
  User(this.name, this.id, this.username, this.email, this.address, this.phone,
      this.website, this.company);
  // SERIALIZATION
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // DESERIALIZATION
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
