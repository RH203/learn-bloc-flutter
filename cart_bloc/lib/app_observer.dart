import 'package:bloc/bloc.dart';
import 'package:cart_bloc/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.debug('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.debug('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.error('onError(${bloc.runtimeType}, $error, $stackTrace)');
  }
}
