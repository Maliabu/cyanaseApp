import 'package:flutter/material.dart';

class ScrollablePage extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const ScrollablePage({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [child],
        ),
      ),
    );
  }
}
