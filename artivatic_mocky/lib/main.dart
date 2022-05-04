
import 'package:artivatic_mocky/list_screen.dart';
import 'package:artivatic_mocky/list_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Artivatic());
}

class Artivatic extends StatelessWidget {
  const Artivatic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => ListProvider(),
      child: MaterialApp(
        home: Scaffold(
          body: ListScreen(),
        ),
      ),
    );
  }
}
