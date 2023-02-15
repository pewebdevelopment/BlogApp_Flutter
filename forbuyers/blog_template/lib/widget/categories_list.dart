import 'package:blog_template/model/category.dart';
import 'package:blog_template/widget/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_template/cubit/categories_cubit.dart';

//Lists all categories horizontally.
class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesCubit>().getCategories();

    return BlocBuilder<CategoriesCubit, List<Category>>(
      builder: (context, categories) {
        return SizedBox(
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryTile(category);
            },
          ),
        );
      },
    );
  }
}
