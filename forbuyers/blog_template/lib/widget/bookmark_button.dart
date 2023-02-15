import 'package:blog_template/cubit/bookmark_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Shows a bookmark icon in the middle of a transparent circle with a gray
//background.
class BookmarkButton extends StatelessWidget {
  final String postId;

  const BookmarkButton(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final cubit = context.read<BookmarkButtonCubit>();
    cubit.get(postId);

    return BlocBuilder<BookmarkButtonCubit, IconData>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            cubit.toggle(postId);
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(.4),
            ),
            child: Icon(
              state,
              size: 30.0,
              color: themeData.colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}
