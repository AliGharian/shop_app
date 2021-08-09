import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/authentication/presentation/logic/internet_cubit.dart';
import 'package:shop_app/features/authentication/presentation/logic/internet_state.dart';
import 'package:shop_app/features/authentication/presentation/logic/splash_state.dart';

class SplashBloc extends Bloc<InternetState, SplashState> {
  late InternetCubit _internetCubit;
  late Connectivity _connectivity;
  late StreamSubscription _internetCubitSubscribtion;
  SplashBloc() : super(InitialSplash()) {
    _connectivity = Connectivity();
    _internetCubit = InternetCubit(connectivity: _connectivity);
    _internetCubitSubscribtion = _internetCubit.stream.listen((event) {
      print('Internet State Changed!');
      this.add(event);
    });
  }

  @override
  Stream<SplashState> mapEventToState(InternetState event) async* {
    if (event is InternetConnected) {
      print('Connected to ${event.connectionType} Internet!');
      String? token = await getValidToken();
      if (token == null) {
        yield GoToSignIn();
      } else {
        yield GoToHome();
      }
    } else if (event is InternetDisconnected) {
      print('Disconnected to Internet!');
      yield NotInternet();
    }
  }

  @override
  Future<void> close() {
    _internetCubitSubscribtion.cancel();
    return super.close();
  }

  Future<String?> getValidToken() async {
    //todo: this line should replace with proper function
    await Future.delayed(Duration(seconds: 2));
    return null;
  }
}
