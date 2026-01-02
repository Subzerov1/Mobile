import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  Map<String, String> name;
  @HiveField(2)
  Map<String, String> jobTitle;
  @HiveField(3)
  String email;
  @HiveField(4)
  String? imagePath;
  @HiveField(5)
  String accessToken;
  UserModel({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.imagePath,
    required this.accessToken,
  });
  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'],
      name: {'ar': json['name_ar'], 'en': json['name_en']},
      jobTitle: {'ar': json['job_title_ar'], 'en': json['job_title_en']},
      email: json['email'],
      imagePath: json['image_path'],
      accessToken: json['access_token'],
    );
  }

  Future update(UserModel newUser) async {
    name = newUser.name;
    jobTitle = newUser.jobTitle;
    imagePath = newUser.imagePath;
    await save();
  }
}
