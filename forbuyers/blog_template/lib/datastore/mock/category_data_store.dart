import 'package:blog_template/datastore/mock/mock_data_store.dart';
import 'package:blog_template/model/category.dart';
import 'package:flutter/material.dart';

/// Mock data store with fake entities to test.
class CategoryDataStore extends MockDataStore<Category> {
  @override
  List<Category> items = [
    Category(id: "c001", icon: Icons.surfing, name: "Surfing"),
    Category(id: "c002", icon: Icons.sailing, name: "Sailing"),
    Category(id: "c003", icon: Icons.sports_basketball, name: "Basketball"),
    Category(id: "c004", icon: Icons.sports_tennis, name: "Tennis"),
    Category(id: "c005", icon: Icons.kayaking, name: "Kayaking"),
    Category(id: "c006", icon: Icons.downhill_skiing, name: "Skiing"),
    Category(id: "c007", icon: Icons.sports_handball, name: "Handball"),
  ];
}
