import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/config/app_configuration.dart';
import 'package:mobile_healthcare/common/config/global_translation.dart';
import 'package:mobile_healthcare/dependencies.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  final AppConfiguration config =
      AppDependencies.injector.get<AppConfiguration>();
  final GlobalTranslation translator =
      AppDependencies.injector.get<GlobalTranslation>();
}

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final AppConfiguration config =
      AppDependencies.injector.get<AppConfiguration>();
  final GlobalTranslation translator =
      AppDependencies.injector.get<GlobalTranslation>();
}
