import 'package:flutter/material.dart';
import 'package:miqat/features/home/presentation/view/widget/adhan_view_body.dart';
import 'package:miqat/generated/l10n.dart';

class AdhanView extends StatelessWidget {
  const AdhanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home_adhan),
      ),
      body: const AdhanViewBody(),
    );
  }
}
