import 'package:flutter/widgets.dart';

@immutable
class ChildBuilder extends StatefulWidget {
  const ChildBuilder({
    super.key,
    required this.builder,
    required this.child,
  });

  final TransitionBuilder builder;
  final Widget child;

  @override
  State<ChildBuilder> createState() => _ChildBuilderState();
}

class _ChildBuilderState extends State<ChildBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, widget.child);
}