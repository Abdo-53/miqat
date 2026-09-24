// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkExceptions {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkExceptions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions()';
}


}

/// @nodoc
class $NetworkExceptionsCopyWith<$Res>  {
$NetworkExceptionsCopyWith(NetworkExceptions _, $Res Function(NetworkExceptions) __);
}


/// Adds pattern-matching-related methods to [NetworkExceptions].
extension NetworkExceptionsPatterns on NetworkExceptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RequestCancelled value)?  requestCancelled,TResult Function( ConnectionTimeout value)?  connectionTimeout,TResult Function( SendTimeout value)?  sendTimeout,TResult Function( ReceiveTimeout value)?  receiveTimeout,TResult Function( ConnectionError value)?  connectionError,TResult Function( BadCertificate value)?  badCertificate,TResult Function( BadRequest value)?  badRequest,TResult Function( Unauthorized value)?  unauthorized,TResult Function( Forbidden value)?  forbidden,TResult Function( NotFound value)?  notFound,TResult Function( MethodNotAllowed value)?  methodNotAllowed,TResult Function( NotAcceptable value)?  notAcceptable,TResult Function( Conflict value)?  conflict,TResult Function( UnprocessableEntity value)?  unprocessableEntity,TResult Function( TooManyRequests value)?  tooManyRequests,TResult Function( InternalServerError value)?  internalServerError,TResult Function( NotImplemented value)?  notImplemented,TResult Function( ServiceUnavailable value)?  serviceUnavailable,TResult Function( BadResponse value)?  badResponse,TResult Function( FormatException value)?  formatException,TResult Function( UnableToProcess value)?  unableToProcess,TResult Function( Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout(_that);case ConnectionError() when connectionError != null:
return connectionError(_that);case BadCertificate() when badCertificate != null:
return badCertificate(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case Unauthorized() when unauthorized != null:
return unauthorized(_that);case Forbidden() when forbidden != null:
return forbidden(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case Conflict() when conflict != null:
return conflict(_that);case UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity(_that);case TooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case BadResponse() when badResponse != null:
return badResponse(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case Unknown() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RequestCancelled value)  requestCancelled,required TResult Function( ConnectionTimeout value)  connectionTimeout,required TResult Function( SendTimeout value)  sendTimeout,required TResult Function( ReceiveTimeout value)  receiveTimeout,required TResult Function( ConnectionError value)  connectionError,required TResult Function( BadCertificate value)  badCertificate,required TResult Function( BadRequest value)  badRequest,required TResult Function( Unauthorized value)  unauthorized,required TResult Function( Forbidden value)  forbidden,required TResult Function( NotFound value)  notFound,required TResult Function( MethodNotAllowed value)  methodNotAllowed,required TResult Function( NotAcceptable value)  notAcceptable,required TResult Function( Conflict value)  conflict,required TResult Function( UnprocessableEntity value)  unprocessableEntity,required TResult Function( TooManyRequests value)  tooManyRequests,required TResult Function( InternalServerError value)  internalServerError,required TResult Function( NotImplemented value)  notImplemented,required TResult Function( ServiceUnavailable value)  serviceUnavailable,required TResult Function( BadResponse value)  badResponse,required TResult Function( FormatException value)  formatException,required TResult Function( UnableToProcess value)  unableToProcess,required TResult Function( Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled(_that);case ConnectionTimeout():
return connectionTimeout(_that);case SendTimeout():
return sendTimeout(_that);case ReceiveTimeout():
return receiveTimeout(_that);case ConnectionError():
return connectionError(_that);case BadCertificate():
return badCertificate(_that);case BadRequest():
return badRequest(_that);case Unauthorized():
return unauthorized(_that);case Forbidden():
return forbidden(_that);case NotFound():
return notFound(_that);case MethodNotAllowed():
return methodNotAllowed(_that);case NotAcceptable():
return notAcceptable(_that);case Conflict():
return conflict(_that);case UnprocessableEntity():
return unprocessableEntity(_that);case TooManyRequests():
return tooManyRequests(_that);case InternalServerError():
return internalServerError(_that);case NotImplemented():
return notImplemented(_that);case ServiceUnavailable():
return serviceUnavailable(_that);case BadResponse():
return badResponse(_that);case FormatException():
return formatException(_that);case UnableToProcess():
return unableToProcess(_that);case Unknown():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RequestCancelled value)?  requestCancelled,TResult? Function( ConnectionTimeout value)?  connectionTimeout,TResult? Function( SendTimeout value)?  sendTimeout,TResult? Function( ReceiveTimeout value)?  receiveTimeout,TResult? Function( ConnectionError value)?  connectionError,TResult? Function( BadCertificate value)?  badCertificate,TResult? Function( BadRequest value)?  badRequest,TResult? Function( Unauthorized value)?  unauthorized,TResult? Function( Forbidden value)?  forbidden,TResult? Function( NotFound value)?  notFound,TResult? Function( MethodNotAllowed value)?  methodNotAllowed,TResult? Function( NotAcceptable value)?  notAcceptable,TResult? Function( Conflict value)?  conflict,TResult? Function( UnprocessableEntity value)?  unprocessableEntity,TResult? Function( TooManyRequests value)?  tooManyRequests,TResult? Function( InternalServerError value)?  internalServerError,TResult? Function( NotImplemented value)?  notImplemented,TResult? Function( ServiceUnavailable value)?  serviceUnavailable,TResult? Function( BadResponse value)?  badResponse,TResult? Function( FormatException value)?  formatException,TResult? Function( UnableToProcess value)?  unableToProcess,TResult? Function( Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout(_that);case ConnectionError() when connectionError != null:
return connectionError(_that);case BadCertificate() when badCertificate != null:
return badCertificate(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case Unauthorized() when unauthorized != null:
return unauthorized(_that);case Forbidden() when forbidden != null:
return forbidden(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case Conflict() when conflict != null:
return conflict(_that);case UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity(_that);case TooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case BadResponse() when badResponse != null:
return badResponse(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case Unknown() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requestCancelled,TResult Function()?  connectionTimeout,TResult Function()?  sendTimeout,TResult Function()?  receiveTimeout,TResult Function()?  connectionError,TResult Function()?  badCertificate,TResult Function()?  badRequest,TResult Function()?  unauthorized,TResult Function()?  forbidden,TResult Function()?  notFound,TResult Function()?  methodNotAllowed,TResult Function()?  notAcceptable,TResult Function()?  conflict,TResult Function()?  unprocessableEntity,TResult Function()?  tooManyRequests,TResult Function()?  internalServerError,TResult Function()?  notImplemented,TResult Function()?  serviceUnavailable,TResult Function()?  badResponse,TResult Function()?  formatException,TResult Function()?  unableToProcess,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled();case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout();case SendTimeout() when sendTimeout != null:
return sendTimeout();case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout();case ConnectionError() when connectionError != null:
return connectionError();case BadCertificate() when badCertificate != null:
return badCertificate();case BadRequest() when badRequest != null:
return badRequest();case Unauthorized() when unauthorized != null:
return unauthorized();case Forbidden() when forbidden != null:
return forbidden();case NotFound() when notFound != null:
return notFound();case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed();case NotAcceptable() when notAcceptable != null:
return notAcceptable();case Conflict() when conflict != null:
return conflict();case UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity();case TooManyRequests() when tooManyRequests != null:
return tooManyRequests();case InternalServerError() when internalServerError != null:
return internalServerError();case NotImplemented() when notImplemented != null:
return notImplemented();case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable();case BadResponse() when badResponse != null:
return badResponse();case FormatException() when formatException != null:
return formatException();case UnableToProcess() when unableToProcess != null:
return unableToProcess();case Unknown() when unknown != null:
return unknown();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requestCancelled,required TResult Function()  connectionTimeout,required TResult Function()  sendTimeout,required TResult Function()  receiveTimeout,required TResult Function()  connectionError,required TResult Function()  badCertificate,required TResult Function()  badRequest,required TResult Function()  unauthorized,required TResult Function()  forbidden,required TResult Function()  notFound,required TResult Function()  methodNotAllowed,required TResult Function()  notAcceptable,required TResult Function()  conflict,required TResult Function()  unprocessableEntity,required TResult Function()  tooManyRequests,required TResult Function()  internalServerError,required TResult Function()  notImplemented,required TResult Function()  serviceUnavailable,required TResult Function()  badResponse,required TResult Function()  formatException,required TResult Function()  unableToProcess,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled();case ConnectionTimeout():
return connectionTimeout();case SendTimeout():
return sendTimeout();case ReceiveTimeout():
return receiveTimeout();case ConnectionError():
return connectionError();case BadCertificate():
return badCertificate();case BadRequest():
return badRequest();case Unauthorized():
return unauthorized();case Forbidden():
return forbidden();case NotFound():
return notFound();case MethodNotAllowed():
return methodNotAllowed();case NotAcceptable():
return notAcceptable();case Conflict():
return conflict();case UnprocessableEntity():
return unprocessableEntity();case TooManyRequests():
return tooManyRequests();case InternalServerError():
return internalServerError();case NotImplemented():
return notImplemented();case ServiceUnavailable():
return serviceUnavailable();case BadResponse():
return badResponse();case FormatException():
return formatException();case UnableToProcess():
return unableToProcess();case Unknown():
return unknown();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requestCancelled,TResult? Function()?  connectionTimeout,TResult? Function()?  sendTimeout,TResult? Function()?  receiveTimeout,TResult? Function()?  connectionError,TResult? Function()?  badCertificate,TResult? Function()?  badRequest,TResult? Function()?  unauthorized,TResult? Function()?  forbidden,TResult? Function()?  notFound,TResult? Function()?  methodNotAllowed,TResult? Function()?  notAcceptable,TResult? Function()?  conflict,TResult? Function()?  unprocessableEntity,TResult? Function()?  tooManyRequests,TResult? Function()?  internalServerError,TResult? Function()?  notImplemented,TResult? Function()?  serviceUnavailable,TResult? Function()?  badResponse,TResult? Function()?  formatException,TResult? Function()?  unableToProcess,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled();case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout();case SendTimeout() when sendTimeout != null:
return sendTimeout();case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout();case ConnectionError() when connectionError != null:
return connectionError();case BadCertificate() when badCertificate != null:
return badCertificate();case BadRequest() when badRequest != null:
return badRequest();case Unauthorized() when unauthorized != null:
return unauthorized();case Forbidden() when forbidden != null:
return forbidden();case NotFound() when notFound != null:
return notFound();case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed();case NotAcceptable() when notAcceptable != null:
return notAcceptable();case Conflict() when conflict != null:
return conflict();case UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity();case TooManyRequests() when tooManyRequests != null:
return tooManyRequests();case InternalServerError() when internalServerError != null:
return internalServerError();case NotImplemented() when notImplemented != null:
return notImplemented();case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable();case BadResponse() when badResponse != null:
return badResponse();case FormatException() when formatException != null:
return formatException();case UnableToProcess() when unableToProcess != null:
return unableToProcess();case Unknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class RequestCancelled implements NetworkExceptions {
  const RequestCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.requestCancelled()';
}


}




/// @nodoc


class ConnectionTimeout implements NetworkExceptions {
  const ConnectionTimeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.connectionTimeout()';
}


}




/// @nodoc


class SendTimeout implements NetworkExceptions {
  const SendTimeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.sendTimeout()';
}


}




/// @nodoc


class ReceiveTimeout implements NetworkExceptions {
  const ReceiveTimeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.receiveTimeout()';
}


}




/// @nodoc


class ConnectionError implements NetworkExceptions {
  const ConnectionError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.connectionError()';
}


}




/// @nodoc


class BadCertificate implements NetworkExceptions {
  const BadCertificate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadCertificate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.badCertificate()';
}


}




/// @nodoc


class BadRequest implements NetworkExceptions {
  const BadRequest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.badRequest()';
}


}




/// @nodoc


class Unauthorized implements NetworkExceptions {
  const Unauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.unauthorized()';
}


}




/// @nodoc


class Forbidden implements NetworkExceptions {
  const Forbidden();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Forbidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.forbidden()';
}


}




/// @nodoc


class NotFound implements NetworkExceptions {
  const NotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.notFound()';
}


}




/// @nodoc


class MethodNotAllowed implements NetworkExceptions {
  const MethodNotAllowed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MethodNotAllowed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.methodNotAllowed()';
}


}




/// @nodoc


class NotAcceptable implements NetworkExceptions {
  const NotAcceptable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotAcceptable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.notAcceptable()';
}


}




/// @nodoc


class Conflict implements NetworkExceptions {
  const Conflict();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.conflict()';
}


}




/// @nodoc


class UnprocessableEntity implements NetworkExceptions {
  const UnprocessableEntity();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnprocessableEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.unprocessableEntity()';
}


}




/// @nodoc


class TooManyRequests implements NetworkExceptions {
  const TooManyRequests();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TooManyRequests);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.tooManyRequests()';
}


}




/// @nodoc


class InternalServerError implements NetworkExceptions {
  const InternalServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.internalServerError()';
}


}




/// @nodoc


class NotImplemented implements NetworkExceptions {
  const NotImplemented();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotImplemented);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.notImplemented()';
}


}




/// @nodoc


class ServiceUnavailable implements NetworkExceptions {
  const ServiceUnavailable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.serviceUnavailable()';
}


}




/// @nodoc


class BadResponse implements NetworkExceptions {
  const BadResponse();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadResponse);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.badResponse()';
}


}




/// @nodoc


class FormatException implements NetworkExceptions {
  const FormatException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormatException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.formatException()';
}


}




/// @nodoc


class UnableToProcess implements NetworkExceptions {
  const UnableToProcess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnableToProcess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.unableToProcess()';
}


}




/// @nodoc


class Unknown implements NetworkExceptions {
  const Unknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.unknown()';
}


}




// dart format on
