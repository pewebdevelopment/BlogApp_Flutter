import 'package:blog_template/model/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeaturedPostTile extends StatelessWidget {
  final Post post;
  final void Function() callback;

  const FeaturedPostTile(this.post, {required this.callback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleSmall =
        themeData.textTheme.titleSmall?.copyWith(color: Colors.white);
    final bodyMedium =
        themeData.textTheme.bodyMedium?.copyWith(color: Colors.white);

    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(
                "assets/${post.firstImage}.jpg",
                fit: BoxFit.cover,
                height: 160.0,
                width: double.infinity,
              ),
              Visibility(
                visible: post.isBookmarked,
                child: Positioned(
                  left: 8.0,
                  top: 8.0,
                  child: Icon(Icons.bookmark,
                      color: themeData.colorScheme.primary),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      post.title,
                      style: titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(DateFormat.yMMMd().format(post.dateGmt),
                        style: bodyMedium),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(Icons.comment,
                            color: Colors.white, size: 16.0),
                        const SizedBox(width: 4.0),
                        Text(post.commentsCount.toString(), style: bodyMedium),
                        const SizedBox(width: 4.0),
                        const Icon(Icons.bookmark,
                            color: Colors.white, size: 16.0),
                        const SizedBox(width: 4.0),
                        Text(post.bookmarksCount.toString(), style: bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
