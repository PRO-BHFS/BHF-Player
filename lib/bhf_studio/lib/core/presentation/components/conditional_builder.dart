import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  final bool condition;
  final Widget Function(BuildContext context) builder;
  final Widget? Function(BuildContext context)? fallback;

  const ConditionalBuilder({
    super.key,
    required this.condition,
    required this.builder,
     this.fallback,
  });

  @override
  Widget build(BuildContext context) => condition
      ? builder(context)
      : fallback?.call(context) ??
            const Center(child: CircularProgressIndicator());
}
