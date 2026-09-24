import 'package:flutter/material.dart';
import 'package:miqat/features/azkar/presentation/view/widget/azkar_grid_view.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(child: AzkarGrid()));
  }
}
