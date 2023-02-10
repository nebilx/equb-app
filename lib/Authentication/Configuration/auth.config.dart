import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions getAndriodOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);
    final storage = FlutterSecureStorage(aOptions: getAndriodOptions());
    