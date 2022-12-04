import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo extends Equatable {
  const NetworkInfo([List properties = const <dynamic>[]]) : super();
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  const NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  List<Object?> get props => const <dynamic>[];
}
