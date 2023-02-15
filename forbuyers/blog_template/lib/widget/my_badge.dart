import 'package:flutter/material.dart';

//Shows an icon in the middle of a framed circle with a gradient background.
class MyBadge extends StatelessWidget {
  final IconData icon;

  const MyBadge({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.light
        ? _lightBadge(context)
        : _darkBadge(context);
  }

  Container _darkBadge(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 5),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.4),
            ),
          ],
          color: Colors.transparent,
          shape: BoxShape.circle),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(75),
          child: Icon(
            icon,
            size: 120,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Container _lightBadge(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.tertiary, width: 5),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.tertiary,
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.4),
            ),
          ],
          shape: BoxShape.circle),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(75),
          child: Icon(
            icon,
            size: 120,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
