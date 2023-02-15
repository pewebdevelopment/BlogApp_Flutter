import 'package:blog_template/cubit/my_comments_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:blog_template/widget/my_comment_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCommentsPage extends StatelessWidget {
  const MyCommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyCommentsCubit>();
    final locals = Locals.of(context);

    cubit.getComments();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.myComments),
      ),
      body: BlocBuilder<MyCommentsCubit, MyCommentsState>(
        builder: (context, state) {
          if (state is InitialMyCommentsState) {
            return const Loading();
          } else {
            state as LoadedMyCommentsState;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];
                return MyCommentTile(
                  comment: comment,
                  callback: (postId) {
                    Navigator.of(context)
                        .pushNamed("/postdetail", arguments: postId);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
