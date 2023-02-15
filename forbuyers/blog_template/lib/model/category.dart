import 'package:blog_template/model/entity.dart';
import 'package:flutter/material.dart';

/// Type represent category entity
class Category extends Entity {
  /// Name of the category
  String name;

  /// Image for the category
  IconData icon;

  Category({required String id, required this.name, required this.icon})
      : super(id: id);
}
