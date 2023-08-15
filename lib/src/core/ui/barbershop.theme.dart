import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

sealed class BarbershopTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsConstants.grey),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: ColorsConstants.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorsConstants.red),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: ColorsConstants.brown,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    ),
  );
}
