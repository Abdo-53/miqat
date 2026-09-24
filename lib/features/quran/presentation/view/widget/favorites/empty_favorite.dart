import 'package:flutter/material.dart';

import 'package:miqat/core/const/app_text_style.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyle.bodyMedium.copyWith(
          color: Theme.of(
            context,
          ).textTheme.bodyMedium?.color?.withValues(alpha: .55),
        ),
      ),
    );
  }
}
