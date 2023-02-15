import 'package:blog_template/model/entity.dart';

/// Type represent user entity
class User extends Entity {
  /// First and last name of the user
  String fullName;

  /// Short description for the user
  String about;

  /// The email address for user
  String email;

  /// Image for user
  String image;

  User(
      {required String id,
      required this.fullName,
      required this.about,
      required this.email,
      required this.image})
      : super(id: id);
}
