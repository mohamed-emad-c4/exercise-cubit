import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_screen/share_prefrence.dart';
import 'package:two_screen/view/home.dart';
import 'package:two_screen/cubit/counter_cubit.dart';
import 'cubit/cubit/thange_them_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تأكد من تشغيل النظام

  int counter = await SharePrefrenceClass().getCounter(key: 'counter');
  runApp(MyApp(counter: counter));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.counter});
  ThemeData theTheme = ThemeData.light();
  final int counter;

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
            home: Home(counter: counter),
          );
        },
      ),
    );
  }
}
