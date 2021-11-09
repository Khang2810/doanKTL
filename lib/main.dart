import 'dart:async';

import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

import 'features/app.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
    runApp(const MyApp());
  }, (error, st) => print(error));
}



