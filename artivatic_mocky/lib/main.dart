
import 'package:artivatic_mocky/list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Artivatic());
}

class Artivatic extends StatelessWidget {
  const Artivatic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: ListScreen(),
        ),
      
    );
  }
}
