import 'package:blog_template/cubit/related_posts_cubit.dart';
import 'package:blog_template/widget/related_post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedPostsList extends StatelessWidget {
  final List<String> ids;

  const RelatedPostsList(this.ids, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RelatedPostsCubit>();
    cubit.getPosts(ids);

    return BlocBuilder<RelatedPostsCubit, RelatedPostsState>(
      builder: (context, state) {
        if (state is InitialRelatedPostsState) {
          return Container(height: 180.0);
        } else {
          state as LoadedRelatedPostsState;

          return SizedBox(
            height: 180.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.relatedPosts.length,
              itemBuilder: (context, index) {
                final post = state.relatedPosts[index];
                return RelatedPostTile(post);
              },
            ),
          );
        }
      },
    );
  }
}
