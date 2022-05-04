import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Function? onInit;
  final Function? dispose;
  final Widget? child;
  final Function? didChangeDependencies;

  const StatefulWrapper(
      {@required this.onInit,
      @required this.child,
      this.dispose,
      this.didChangeDependencies});

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit!();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose != null) {
      widget.dispose!();
    }
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  void didChangeDependencies() {
    if (widget.didChangeDependencies != null) {
      widget.didChangeDependencies!();
    }
    super.didChangeDependencies();
  }
}
