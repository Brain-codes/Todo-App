import 'dart:convert';

List<UserObject> eachUserFromJson(String str) =>
    List<UserObject>.from(json.decode(str).map((x) => UserObject.fromJson(x)));

String eachUserToJson(List<UserObject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserObject {
  String? fullname;
  String? email;
  String? phone;
  String? dob;

// added '?'

  UserObject({
    this.fullname,
    this.email,
    this.phone,
    this.dob,
  });
  // can also add 'required' keyword

  factory UserObject.fromJson(Map<String, dynamic> json) => UserObject(
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "dob": dob,
      };
}
