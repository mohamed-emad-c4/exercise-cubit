import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'thange_them_state.dart';

class ThangeThemCubit extends Cubit<ThangeThemState> {
  ThangeThemCubit() : super(ThangeThemInitial());
  ThemeData currentTheme = ThemeData.light();
  void changeThemeToDark() {
    currentTheme = ThemeData.dark();
    emit(ThangeThemChangeDark());
  }

  void changeThemeToLight() {
    currentTheme = ThemeData.light();
    emit(ThangeThemChangeLight());
  }

  void changeThem() {
    
    emit(ThemChange());
  }
}
