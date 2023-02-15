import 'package:blog_template/model/category.dart';
import 'package:blog_template/navigation/posts_page_parameters.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return GestureDetector(
      onTap: () {
        final params = PostsPageParameters(categoryId: category.id);
        Navigator.of(context).pushNamed("/posts", arguments: params);
      },
      child: SizedBox(
        width: 90.0,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.cardColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  category.icon,
                  color: themeData.colorScheme.primary,
                  size: 40.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(category.name, style: titleSmall),
          ],
        ),
      ),
    );
  }
}
