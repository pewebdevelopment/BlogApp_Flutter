import 'package:blog_template/datastore/mock/mock_data_store.dart';
import 'package:blog_template/model/keyword.dart';

class KeywordDataStore extends MockDataStore<Keyword> {
  @override
  List<Keyword> items = [
    Keyword(id: "k001", keyword: "fusce"),
    Keyword(id: "k002", keyword: "nulla"),
    Keyword(id: "k003", keyword: "placerat"),
    Keyword(id: "k004", keyword: "neque"),
  ];
}
