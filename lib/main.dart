import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:uber_driver/dataprovider.dart';
import 'package:uber_driver/globalvariabels.dart';
import 'package:uber_driver/screens/login.dart';
import 'package:uber_driver/screens/registration.dart';
import 'package:uber_driver/screens/vehicleinfo.dart';

import './screens/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: Platform.isIOS
        ? const FirebaseOptions(
            googleAppID: '1:74522177576:ios:a838855ee93d2d5b5c851d',
            gcmSenderID: '74522177576',
            databaseURL: 'https://geetaxi-47a21-default-rtdb.firebaseio.com',
          )
        : const FirebaseOptions(
            googleAppID: '1:74522177576:android:28e6d9b39b5f94a35c851d',
            apiKey: 'AIzaSyBYLAu4hXN__HQ1Sl2sAZKqHS2v8N9TYGM',
            databaseURL: 'https://geetaxi-47a21-default-rtdb.firebaseio.com',
          ),
  );

  currentFirebaseUser = await FirebaseAuth.instance.currentUser();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: MainPage.id,
        // (currentFirebaseUser == null) ? LoginPage.id : MainPage.id,
        routes: {
          MainPage.id: (context) => MainPage(),
          RegistrationPage.id: (context) => RegistrationPage(),
          VehicleInfoPage.id: (context) => VehicleInfoPage(),
          LoginPage.id: (context) => LoginPage(),
        },
      ),
    );
  }
}
