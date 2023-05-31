import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final String? appBarTitle;
  final Widget body;
  final Widget? bottomNav;
  final Widget? fab;
  final Color? color;
  const BaseLayout({
    super.key,
    this.appBarTitle,
    required this.body,
    this.bottomNav,
    this.fab,
    this.color = Colors.transparent,
  });

  AppBar? _appBar() {
    if (appBarTitle == null) return null;
    return AppBar(
      elevation: 0,
      title: Image.asset(
        'assets/images/logo_long.png',
        height: 80,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: bottomNav,
      floatingActionButton: fab,
    );
  }
}
