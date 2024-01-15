import 'dart:async';

import 'package:data_managing_core/data_managing_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

final core = DataManagingCore();

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await core.init();
    runApp(const App());
  }, (error, stackTrace) {});
}
