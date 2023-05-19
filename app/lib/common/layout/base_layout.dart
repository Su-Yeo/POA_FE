import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BaseLayout extends StatelessWidget {
  final Color? backgrondColor;
  final String? title;
  final Widget body;
  final Widget? bottomNav;
  final VoidCallback? actionPressed;
  final IconData? actionIcon;
  const BaseLayout({
    super.key,
    this.backgrondColor,
    this.title,
    required this.body,
    this.bottomNav,
    this.actionPressed,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor,
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: bottomNav,
    );
  }

  AppBar? _appBar() {
    if (title == null) return null;

    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: actionPressed,
          icon: Icon(actionIcon),
        ),
      ],
      elevation: 0,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: body,
    );
  }
}
