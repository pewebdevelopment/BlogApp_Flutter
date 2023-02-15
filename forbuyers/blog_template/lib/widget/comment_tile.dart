import 'package:blog_template/model/comment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentTile extends StatelessWidget {
  const CommentTile(this.comment, {this.margin = 0.0, Key? key})
      : super(key: key);

  final Comment comment;
  final double margin;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyMedium = themeData.textTheme.bodyMedium;
    final italicBodyMedium = bodyMedium?.copyWith(fontStyle: FontStyle.italic);

    return Container(
      margin: EdgeInsets.all(margin),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: themeData.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "\"${comment.content}\"",
            style: italicBodyMedium,
          ),
          const SizedBox(height: 8.0),
          Text(
            "- ${comment.authorName} | ${DateFormat.yMMMd().format(comment.dateGmt)}",
            style: bodyMedium,
          ),
        ],
      ),
    );
  }
}
