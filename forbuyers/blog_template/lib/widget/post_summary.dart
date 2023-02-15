import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostSummary extends StatelessWidget {
  final BuildContext context;
  final String image;
  final String title;
  final String authorName;
  final DateTime dateGmt;

  const PostSummary(
      this.context, this.image, this.title, this.authorName, this.dateGmt,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleSmall = themeData.textTheme.titleSmall;
    final bodyMedium = themeData.textTheme.bodyMedium;

    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Image.asset(
            "assets/$image.jpg",
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: titleSmall, maxLines: 2),
              const SizedBox(height: 8.0),
              Text(
                "$authorName | ${DateFormat.yMMMd().format(dateGmt)}",
                style: bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
