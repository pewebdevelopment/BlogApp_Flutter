import 'package:flutter/material.dart';

class LinkLabel extends StatelessWidget {
  final String caption;
  final void Function(BuildContext) callback;

  const LinkLabel({required this.caption, required this.callback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final accentUnderlineLabelLarge = themeData.textTheme.labelLarge?.copyWith(
        decoration: TextDecoration.underline,
        color: themeData.colorScheme.primary);

    return GestureDetector(
      onTap: () {
        callback(context);
      },
      child: Text(caption, style: accentUnderlineLabelLarge),
    );
  }
}
