import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  primarySwatch: Colors.yellow,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white24),
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: const TextTheme(
      labelSmall: TextStyle(
          color: Colors.white30, fontSize: 20, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      )),
);
