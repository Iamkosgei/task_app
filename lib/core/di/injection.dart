import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:taks_app/core/di/injection.config.dart';

//ackage:taks_app/core/di/injection.config.dar

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
