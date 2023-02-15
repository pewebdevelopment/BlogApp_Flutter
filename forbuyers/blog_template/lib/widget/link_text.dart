import 'package:blog_template/app_theme.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  final String accentText;
  final void Function() callback;

  const LinkText(
      {required this.text,
      required this.accentText,
      required this.callback,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final secondaryLabelLarge = themeData.textTheme.labelLarge
        ?.copyWith(color: AppTheme.secondaryTextColor(context));
    final accentUnderlineLabelLarge = themeData.textTheme.labelLarge?.copyWith(
        decoration: TextDecoration.underline,
        color: themeData.colorScheme.primary);

    return GestureDetector(
      onTap: () {
        callback();
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text,
          style: secondaryLabelLarge,
          children: [
            TextSpan(
              text: accentText,
              style: accentUnderlineLabelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
