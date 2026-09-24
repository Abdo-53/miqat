import 'package:flutter/material.dart';
import 'package:miqat/features/quran/presentation/view/widget/mushaf_body.dart';

class MushafView extends StatelessWidget {
  const MushafView({super.key, required this.startPage});

  final int startPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(child: MushafBody(startPage: startPage)),
    );
  }
}
