import 'package:blog_template/app_theme.dart';
import 'package:blog_template/widget/link_text.dart';
import 'package:flutter/material.dart';

class ExtendedButtonPanel extends StatelessWidget {
  final String text;
  final String accentText;
  final String buttonCaption;
  final void Function() textCallback;
  final void Function() buttonCallback;

  const ExtendedButtonPanel({
    required this.text,
    required this.accentText,
    required this.textCallback,
    required this.buttonCaption,
    required this.buttonCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.4),
          ),
        ],
        color: themeData.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          LinkText(text: text, accentText: accentText, callback: textCallback),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: buttonCallback,
            style: AppTheme.roundedButtonStyle,
            child: Text(buttonCaption),
          ),
        ],
      ),
    );
  }
}
