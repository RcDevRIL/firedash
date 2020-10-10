import 'package:get_it/get_it.dart';

import 'dialog_service.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<DialogService>(
    DialogService(),
    signalsReady: true,
  );
}
