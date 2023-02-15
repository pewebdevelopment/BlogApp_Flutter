import 'package:blog_template/cubit/post_detail_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/bookmark_button.dart';
import 'package:blog_template/widget/chic_button.dart';
import 'package:blog_template/widget/comment_tile.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:blog_template/widget/related_posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PostDetailPage extends StatelessWidget {
  final String postId;

  const PostDetailPage(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostDetailCubit>();
    final locals = Locals.of(context);
    final themeData = Theme.of(context);
    final boldTitleLarge =
        themeData.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);
    final boldTitleMedium =
        themeData.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold);
    final accentBodyLarge = themeData.textTheme.bodyLarge
        ?.copyWith(color: themeData.colorScheme.primary);
    final bodyMedium = themeData.textTheme.bodyMedium;

    cubit.getPost(postId);

    return Scaffold(
      appBar: AppBar(title: Text(locals.postDetail)),
      body: BlocBuilder<PostDetailCubit, PostDetailState>(
        builder: (context, state) {
          if (state is InitialPostDetailState) {
            return const Loading();
          } else {
            state as LoadedPostDetailState;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      _postImagesPager(state, cubit),
                      Positioned(
                        top: 24.0,
                        left: 24.0,
                        child: BookmarkButton(postId),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.postTitle, style: boldTitleLarge),
                        const SizedBox(height: 16.0),
                        Text(
                          "${state.postAuthorName} | ${DateFormat.yMMMd().format(state.postDateGmt)}",
                          textAlign: TextAlign.right,
                          style: accentBodyLarge,
                        ),
                        const SizedBox(height: 16.0),
                        Text(state.postContent, style: bodyMedium),
                        const SizedBox(height: 16.0),
                        Text(locals.recentComment, style: boldTitleMedium),
                        const SizedBox(height: 16.0),
                        CommentTile(state.comment),
                        const SizedBox(height: 16.0),
                        ChicButton(
                          icon: Icons.comment,
                          caption: locals.showComments,
                          callback: () {
                            cubit.showComments(context, postId);
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(locals.relatedPosts, style: boldTitleMedium),
                        const SizedBox(height: 16.0),
                        RelatedPostsList(state.postRelatedIds)
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  ClipRRect _postImagesPager(
      LoadedPostDetailState state, PostDetailCubit cubit) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: PageView.builder(
          pageSnapping: true,
          itemCount: state.postImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                cubit.photoBrowser(context, state.postImages[index]);
              },
              child: Image.asset(
                "assets/${state.postImages[index]}.jpg",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
