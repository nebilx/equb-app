import 'package:equb_app/Authentication/Screens/signin.dart';
import 'package:equb_app/Equb/User/Services/equb.services.dart';
import 'package:equb_app/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'dotenv/secret.env');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserEqubServices()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Equb-App',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Splash());
  }
}
