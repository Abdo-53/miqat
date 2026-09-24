import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/err/network_exceptions.dart';
import 'package:miqat/generated/l10n.dart';

class NetworkErrorView extends StatelessWidget {
  const NetworkErrorView({
    super.key,
    required this.exception,
    required this.onRetry,
  });

  final NetworkExceptions exception;
  final VoidCallback onRetry;

  String _getErrorMessage(BuildContext context) {
    final l = S.of(context);

    return exception.when(
      requestCancelled: () => l.networkUnexpected,
      connectionTimeout: () => l.networkTimeout,
      sendTimeout: () => l.networkTimeout,
      receiveTimeout: () => l.networkTimeout,
      connectionError: () => l.networkNoInternet,
      badCertificate: () => l.networkUnexpected,
      badRequest: () => l.networkUnexpected,
      unauthorized: () => l.networkUnauthorized,
      forbidden: () => l.networkForbidden,
      notFound: () => l.networkNotFound,
      methodNotAllowed: () => l.networkUnexpected,
      notAcceptable: () => l.networkUnexpected,
      conflict: () => l.networkUnexpected,
      unprocessableEntity: () => l.networkUnexpected,
      tooManyRequests: () => l.networkServerError,
      internalServerError: () => l.networkServerError,
      notImplemented: () => l.networkServerError,
      serviceUnavailable: () => l.networkServerError,
      badResponse: () => l.networkUnexpected,
      formatException: () => l.networkUnexpected,
      unableToProcess: () => l.networkUnexpected,
      unknown: () => l.networkUnexpected,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = S.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 52,
              color: AppColor.primary,
            ),
            const SizedBox(height: 16),
            Text(
              l.networkErrorTitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.titleLarge.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _getErrorMessage(context),
              textAlign: TextAlign.center,
              style: AppTextStyle.bodyMedium.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.6),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(
                l.retry,
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
