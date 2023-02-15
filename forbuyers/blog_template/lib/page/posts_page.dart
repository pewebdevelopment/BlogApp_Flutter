import 'package:blog_template/cubit/posts_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/service/sort_by.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:blog_template/widget/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  final String? keyword;
  final String? categoryId;
  final bool onlyBookmarkeds;
  final SortBy sortBy;

  const PostsPage(
      this.keyword, this.categoryId, this.onlyBookmarkeds, this.sortBy,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostsCubit>();
    final locals = Locals.of(context);

    SortBy sortBy = this.sortBy;

    cubit.getPosts(keyword, categoryId, onlyBookmarkeds, sortBy);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.posts),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.swap_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem<SortBy>(
                  value: SortBy.unsorted,
                  child: Text(locals.default_),
                ),
                PopupMenuItem<SortBy>(
                  value: SortBy.newToOld,
                  child: Text(locals.newToOld),
                ),
                PopupMenuItem<SortBy>(
                  value: SortBy.oldToNew,
                  child: Text(locals.oldToNew),
                ),
                PopupMenuItem<SortBy>(
                  value: SortBy.mostCommented,
                  child: Text(locals.mostCommented),
                ),
                PopupMenuItem<SortBy>(
                  value: SortBy.mostBookmarked,
                  child: Text(locals.mostBookmarked),
                ),
              ];
            },
            onSelected: (value) {
              sortBy = value;
              cubit.getPosts(keyword, categoryId, onlyBookmarkeds, sortBy);
            },
          )
        ],
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is InitialPostsState) {
            return const Loading();
          } else {
            state as LoadedPostsState;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return PostTile(
                  post,
                  callback: () => Navigator.of(context)
                      .pushNamed("/postdetail", arguments: post.id)
                      .then(
                        (_) => cubit.getPosts(
                            keyword, categoryId, onlyBookmarkeds, sortBy),
                      ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
