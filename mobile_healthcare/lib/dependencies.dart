import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mobile_healthcare/common/config/app_configuration.dart';
import 'package:mobile_healthcare/common/config/file_utility.dart';
import 'package:mobile_healthcare/common/config/global_translation.dart';

class AppDependencies {
  static Injector get injector => Injector.getInjector();

  static Injector initialize(String rootFolder) {
    injector.map<GlobalTranslation>((injector) => GlobalTranslation(),
        isSingleton: true);
    injector.map<AppConfiguration>((injector) => AppConfiguration(),
        isSingleton: true);
    injector.map<FileUtility>((injector) => FileUtility(rootFolder),
        isSingleton: true);
    return injector;
  }
}
