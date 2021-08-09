import 'package:shop_app/core/enums.dart';

abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
