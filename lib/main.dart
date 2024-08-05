import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_screen/view/home.dart';
import 'package:two_screen/view/second_screen.dart';
import 'package:two_screen/cubit/counter_cubit.dart';

import 'cubit/cubit/thange_them_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ThemeData theTheme = ThemeData.light();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ThangeThemCubit(),
        ),
      ],
      child: BlocConsumer<ThangeThemCubit, ThangeThemState>(
        listener: (context, state) {
          if (state is ThangeThemChangeDark) {
            theTheme = ThemeData.dark();
          } else if (state is ThangeThemChangeLight) {
            theTheme = ThemeData.light();
          } else if (state is ThemChange) {
            if (theTheme == ThemeData.dark()) {
              theTheme = ThemeData.light();
            } else {
              theTheme = ThemeData.dark();
            }
          }
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Exercise Cubit',
            theme: theTheme,
            home: Home(),
          );
        },
      ),
    );
  }
}
