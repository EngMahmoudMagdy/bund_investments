import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  static const List properties = <dynamic>[];
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  const Failure([List? properties = properties]);

  @override
  List<Object> get props => [properties];
}

// General failures
class ServerFailure extends Failure {
  final List? properties;
  const ServerFailure([this.properties]) : super(properties);
}

class AuthFailure extends Failure {
  final List? properties;
  const AuthFailure([this.properties]) : super(properties);
}

class PermissionFailure extends Failure {
  final List? properties;
  const PermissionFailure([this.properties]) : super(properties);
}

class CacheFailure extends Failure {
  final List? properties;
  const CacheFailure([this.properties]) : super(properties);
}

class ConnectionFailure extends Failure {
  final List? properties;
  const ConnectionFailure([this.properties]) : super(properties);
}
