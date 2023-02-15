import 'package:blog_template/model/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostTile extends StatelessWidget {
  final Post post;
  final void Function() callback;

  const PostTile(this.post, {required this.callback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleSmallTextStyle = themeData.textTheme.titleSmall;
    final bodyMediumTextStyle = themeData.textTheme.bodyMedium;

    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: themeData.cardColor,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  child: Image.asset(
                    "assets/${post.firstImage}.jpg",
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
                Visibility(
                  visible: post.isBookmarked,
                  child: Positioned(
                    left: 8.0,
                    top: 8.0,
                    child: Icon(
                      Icons.bookmark,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    post.title,
                    style: titleSmallTextStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    post.content,
                    style: bodyMediumTextStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        size: 20.0,
                        color: themeData.colorScheme.primary,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        DateFormat.yMMMd().format(post.dateGmt),
                        style: bodyMediumTextStyle,
                      ),
                      const SizedBox(width: 8.0),
                      Icon(
                        Icons.comment,
                        size: 20.0,
                        color: themeData.colorScheme.primary,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        post.commentsCount.toString(),
                        style: bodyMediumTextStyle,
                      ),
                      const SizedBox(width: 8.0),
                      Icon(
                        Icons.bookmark,
                        size: 20.0,
                        color: themeData.colorScheme.primary,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        post.bookmarksCount.toString(),
                        style: bodyMediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
