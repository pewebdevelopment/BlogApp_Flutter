import 'package:blog_template/datastore/mock/mock_data_store.dart';
import 'package:blog_template/model/user.dart';

class UserDataStore extends MockDataStore<User> {
  @override
  List<User> items = [
    User(
        id: "u001",
        fullName: "Jane Doe",
        email: "janedoe@gmail.com",
        image: "jane_doe",
        about:
            "Etiam vel purus ac ligula efficitur bibendum et eget nulla. Integer maximus aliquam ex, id accumsan erat tempor at. Quisque cursus bibendum nisi id imperdiet."),
    User(
        id: "u002",
        fullName: "John Doe",
        email: "johndoe@gmail.com",
        image: "john_doe",
        about:
            "Pellentesque vehicula libero in nisi porttitor consequat. Vestibulum condimentum sit amet sem at euismod. Sed nec mauris quam.")
  ];
}
