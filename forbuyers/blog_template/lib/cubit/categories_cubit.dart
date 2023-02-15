import 'package:blog_template/locator.dart';
import 'package:blog_template/model/category.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<List<Category>> {
  final Service service = getIt<Service>();

  CategoriesCubit() : super(<Category>[]);

  void getCategories() async {
    var categories = await service.getCategories();
    emit(categories);
  }
}
