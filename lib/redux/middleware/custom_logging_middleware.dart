import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

final Logger logger = new Logger("Redux-Log");

class CustomLoggingMiddleware implements LoggingMiddleware {

  @override
  void call(Store store, action, NextDispatcher next) {
    super(store,action,next);
  }

  @override
  MessageFormatter get formatter => null;

  @override
  Level get level => Level.INFO;

  @override
  Logger get logger => logger;
}
