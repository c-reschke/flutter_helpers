import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(8.0),
    this.borderColor = Colors.grey,
    this.borderRadius = 12.0
  });

  final Widget? child;
  final EdgeInsets padding;
  final Color borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
