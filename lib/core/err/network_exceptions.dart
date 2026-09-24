import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
sealed class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.connectionTimeout() = ConnectionTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.receiveTimeout() = ReceiveTimeout;

  const factory NetworkExceptions.connectionError() = ConnectionError;

  const factory NetworkExceptions.badCertificate() = BadCertificate;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.unauthorized() = Unauthorized;

  const factory NetworkExceptions.forbidden() = Forbidden;

  const factory NetworkExceptions.notFound() = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.unprocessableEntity() = UnprocessableEntity;

  const factory NetworkExceptions.tooManyRequests() = TooManyRequests;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.badResponse() = BadResponse;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.unknown() = Unknown;

  /// Converts a Dio/Socket/other exception into a unified
  /// NetworkExceptions value.
  static NetworkExceptions fromException(Object error) {
    if (error is DioException) {
      return _handleDioException(error);
    }

    if (error is SocketException) {
      return const NetworkExceptions.connectionError();
    }

    if (error is FormatException) {
      return const NetworkExceptions.formatException();
    }

    return const NetworkExceptions.unknown();
  }

  static NetworkExceptions _handleDioException(
    DioException exception,
  ) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        return const NetworkExceptions.requestCancelled();

      case DioExceptionType.connectionTimeout:
        return const NetworkExceptions.connectionTimeout();

      case DioExceptionType.sendTimeout:
        return const NetworkExceptions.sendTimeout();

      case DioExceptionType.receiveTimeout:
        return const NetworkExceptions.receiveTimeout();

      case DioExceptionType.connectionError:
        return const NetworkExceptions.connectionError();

      case DioExceptionType.badCertificate:
        return const NetworkExceptions.badCertificate();

      case DioExceptionType.badResponse:
        return _handleStatusCode(exception.response?.statusCode);

      case DioExceptionType.unknown:
        return const NetworkExceptions.unknown();

      case DioExceptionType.transformTimeout:
        return const NetworkExceptions.receiveTimeout();
    }
  }

  static NetworkExceptions _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const NetworkExceptions.badRequest();

      case 401:
        return const NetworkExceptions.unauthorized();

      case 403:
        return const NetworkExceptions.forbidden();

      case 404:
        return const NetworkExceptions.notFound();

      case 405:
        return const NetworkExceptions.methodNotAllowed();

      case 406:
        return const NetworkExceptions.notAcceptable();

      case 409:
        return const NetworkExceptions.conflict();

      case 422:
        return const NetworkExceptions.unprocessableEntity();

      case 429:
        return const NetworkExceptions.tooManyRequests();

      case 500:
        return const NetworkExceptions.internalServerError();

      case 501:
        return const NetworkExceptions.notImplemented();

      case 503:
        return const NetworkExceptions.serviceUnavailable();

      default:
        return const NetworkExceptions.badResponse();
    }
  }
}
