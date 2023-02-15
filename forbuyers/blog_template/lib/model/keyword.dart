import 'package:blog_template/model/entity.dart';

class Keyword extends Entity {
  final String keyword;
  final DateTime dateGmt = DateTime.now().toUtc();

  Keyword({required String id, required this.keyword}) : super(id: id);
}
