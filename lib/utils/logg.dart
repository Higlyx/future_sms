import 'dart:developer' as dv;

void logg(dynamic message, {StackTrace? stackTrace}) {
  dv.log('$message', name: 'Future_SMS', stackTrace: stackTrace);
}
