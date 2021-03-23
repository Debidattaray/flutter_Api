import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String job;
  String id;
  DateTime createdAt;

  UserModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}





// import 'dart:convert';

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//   UserModel({
//     this.id,
//     this.title,
//     this.description,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });

//   String id;
//   String title;
//   String description;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json["_id"],
//         title: json["title"],
//         description: json["description"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "title": title,
//         "description": description,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }
