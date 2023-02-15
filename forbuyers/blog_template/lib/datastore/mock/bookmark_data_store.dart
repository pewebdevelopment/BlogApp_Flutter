import 'package:blog_template/datastore/mock/mock_data_store.dart';
import 'package:blog_template/model/bookmark.dart';

class BookmarkDataStore extends MockDataStore<Bookmark> {
  @override
  List<Bookmark> items = [
    Bookmark(id: "b001", userId: "u001", postId: "p001"),
    Bookmark(id: "b002", userId: "u001", postId: "p023"),
    Bookmark(id: "b003", userId: "u001", postId: "p028"),
    Bookmark(id: "b004", userId: "u001", postId: "p014"),
    Bookmark(id: "b005", userId: "u001", postId: "p016"),
    Bookmark(id: "b006", userId: "u001", postId: "p020"),
    Bookmark(id: "b007", userId: "u001", postId: "p027"),
    Bookmark(id: "b008", userId: "u002", postId: "p010"),
    Bookmark(id: "b009", userId: "u002", postId: "p023"),
    Bookmark(id: "b010", userId: "u002", postId: "p028"),
    Bookmark(id: "b011", userId: "u002", postId: "p004"),
    Bookmark(id: "b012", userId: "u002", postId: "p018"),
    Bookmark(id: "b013", userId: "u002", postId: "p021"),
    Bookmark(id: "b014", userId: "u002", postId: "p012"),
  ];
}
