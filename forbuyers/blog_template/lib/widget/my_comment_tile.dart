import 'package:blog_template/model/comment.dart';
import 'package:blog_template/widget/post_summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCommentTile extends StatelessWidget {
  final Comment comment;
  final void Function(String postId) callback;

  const MyCommentTile({required this.comment, required this.callback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyMedium = themeData.textTheme.bodyMedium;
    final italicBodyMedium =
        themeData.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic);
    final yMMMd = DateFormat.yMMMd();

    return GestureDetector(
      onTap: () {
        callback(comment.postId);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: themeData.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PostSummary(context, comment.postImage, comment.postTitle,
                comment.authorName, comment.postDateGmt),
            const SizedBox(height: 8.0),
            Text("\"${comment.content}\"", style: italicBodyMedium),
            const SizedBox(height: 8.0),
            Text("- ${yMMMd.format(comment.dateGmt)}", style: bodyMedium),
          ],
        ),
      ),
    );
  }
}
