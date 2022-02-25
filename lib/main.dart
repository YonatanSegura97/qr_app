import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_app/pages/home_page.dart';
import 'package:qr_app/pages/map_page.dart';
import 'package:flutter/services.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

void main() => runApp(QRApp());

class QRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.blueGrey,
            appBarTheme: const AppBarTheme(color: Colors.blueGrey),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.blueGrey),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.blueGrey)),
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'map_screen': (_) => const MapPage()
        },
      ),
    );
  }
}
