import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void locatorService() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
