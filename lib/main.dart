import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starwars_app/main/app.dart';
import 'package:starwars_app/main/app_environment.dart';
import 'package:starwars_app/main/injection.dart';
import 'package:starwars_app/main/observers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  await configureDependencies(EnvInfo.envName);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
      ));
  await Firebase.initializeApp();
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: App(),
  ));
}