import 'package:blog_template/widget/user_avatar.dart';
import 'package:flutter/material.dart';

class UserAvatarWithEditButton extends StatelessWidget {
  final String image;
  final void Function() callback;

  const UserAvatarWithEditButton(
      {required this.image, required this.callback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserAvatar(image: "assets/$image.jpg"),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: GestureDetector(
            onTap: callback,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
                color: Theme.of(context).cardColor,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30.0),
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
