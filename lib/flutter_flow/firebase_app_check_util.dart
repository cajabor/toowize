import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6LfDRkApAAAAAJeUJEo5ywDg7wXiwQlJU02ckGRZ'),
      androidProvider: AndroidProvider.playIntegrity,
    );
