import 'package:blog_template/app_theme.dart';
import 'package:blog_template/cubit/comments_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/comment_tile.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:blog_template/widget/post_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatelessWidget {
  final String postId;
  const CommentsPage(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CommentsCubit>();
    final locals = Locals.of(context);
    final editYourComment = TextEditingController();

    cubit.load(postId);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.comments),
      ),
      body: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          if (state is InitialCommentsState) {
            return const Loading();
          } else {
            state as LoadedCommentsState;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PostSummary(context, state.postImage, state.postTitle,
                            state.postAuthorName, state.postDateGmt),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          controller: editYourComment,
                          decoration:
                              InputDecoration(label: Text(locals.yourComment)),
                        ),
                        const SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            cubit.addComment(
                                context, postId, editYourComment.text);
                          },
                          style: AppTheme.roundedButtonStyle,
                          child: Text(locals.submitMyComment),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        final comment = state.comments[index];
                        return CommentTile(comment, margin: 8.0);
                      },
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
}
