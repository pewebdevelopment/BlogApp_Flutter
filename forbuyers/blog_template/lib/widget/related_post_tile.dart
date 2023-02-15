import 'package:blog_template/model/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RelatedPostTile extends StatelessWidget {
  const RelatedPostTile(this.post, {Key? key}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleSmall =
        themeData.textTheme.titleSmall?.copyWith(color: Colors.white);
    final bodyMedium =
        themeData.textTheme.bodyMedium?.copyWith(color: Colors.white);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushReplacementNamed("/postdetail", arguments: post.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(
                "assets/${post.firstImage}.jpg",
                fit: BoxFit.cover,
                width: 180.0,
                height: 180.0,
              ),
              Container(
                width: 180.0,
                padding: const EdgeInsets.all(8.0),
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      post.title,
                      style: titleSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      DateFormat.yMMMd().format(post.dateGmt),
                      style: bodyMedium,
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.comment,
                          color: Colors.white,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          post.commentsCount.toString(),
                          style: bodyMedium,
                        ),
                        const SizedBox(width: 4.0),
                        const Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          post.bookmarksCount.toString(),
                          style: bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
