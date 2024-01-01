import 'dart:io';
import 'package:card_game_serve_and_flip_animation/provider/create_game_provider.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/provider/socket_provider.dart';
import 'package:card_game_serve_and_flip_animation/screens/splash_screen.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

final samllCardSpriteSheet = SpriteSheet(
  imageName: 'sprint_cards_small.png',
  columns: 13,
  rows: 5,
  textureWidth: 90,
  textureHeight: 125,
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  samllCardSpriteSheet.getSprite(1, 1);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((value) => runApp( MyApp()));

  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        SizerUtil().init(constraints, orientation);
        return MultiProvider(providers: [
          ChangeNotifierProvider<RummyProvider>(create: (_) => RummyProvider()),
          ChangeNotifierProvider<CreateGameProvider>(create: (_) => CreateGameProvider()),
          ChangeNotifierProvider<SocketProvider>(create: (_) => SocketProvider()),
        ],child: MaterialApp(
          title: 'Rummy & Poker',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),);
      });
    });
  }
}
