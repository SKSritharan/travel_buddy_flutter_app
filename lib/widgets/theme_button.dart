import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class ThemeButton extends StatefulWidget {
  final AppTheme appTheme;

  ThemeMode getThemeMode(String value) {
    switch (value.toLowerCase()) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  const ThemeButton({super.key, required this.appTheme});

  @override
  State<ThemeButton> createState() =>
      _ThemeButtonState(getThemeMode(appTheme.getCurrentThemeMode()));
}

class _ThemeButtonState extends State<ThemeButton>
    with SingleTickerProviderStateMixin {
  late IconData _iconData;
  late AnimationController _controller;
  late Animation<double> _animation;
  late ThemeMode _currentTheme;

  _ThemeButtonState(ThemeMode currentTheme) {
    _setIconData(currentTheme);
  }

  @override
  void initState() {
    super.initState();
    _currentTheme = widget.getThemeMode(widget.appTheme.getCurrentThemeMode());
    _setIconData(_currentTheme);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setIconData(ThemeMode currentTheme) {
    if (currentTheme == ThemeMode.light) {
      _iconData = Icons.wb_sunny;
    } else {
      _iconData = Icons.dark_mode;
    }
  }

  void _toggleTheme() {
    widget.appTheme.toggleTheme();
    final newTheme = widget.getThemeMode(widget.appTheme.getCurrentThemeMode());
    _controller.reset();
    _controller.forward();
    setState(() {
      _currentTheme = newTheme;
      _setIconData(newTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 800.0),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Transform.rotate(
              angle: value * pi * 2,
              child: child,
            );
          },
          child: IconButton(
            onPressed: _toggleTheme,
            icon: Icon(_iconData),
            color: Theme.of(context).accentColor,
            iconSize: 30,
          ),
        );
      },
    );
  }
}
