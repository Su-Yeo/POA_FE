import 'package:app/common/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BaseLayout extends StatelessWidget {
  final Color? backgrondColor;
  // final String? title;
  final Widget? title;
  final Widget body;
  final Widget? bottomNav;
  final VoidCallback? actionPressed;
  final VoidCallback? leadingPressed;
  final IconData? actionIcon;
  final IconData? leadingIcon;
  const BaseLayout({
    super.key,
    this.backgrondColor,
    this.title,
    required this.body,
    this.bottomNav,
    this.actionPressed,
    this.leadingPressed,
    this.actionIcon,
    this.leadingIcon,
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
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(leadingIcon),
            onPressed: leadingPressed,
            // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: actionPressed,
          icon: Icon(actionIcon),
        ),
      ],
      elevation: 0,
      // title: Text(
      //   title!,
      //   style: const TextStyle(
      //     fontSize: 16.0,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      title: title,
    );
  }

  Widget _body() {
    return SafeArea(
      child: body,
    );
  }
}
