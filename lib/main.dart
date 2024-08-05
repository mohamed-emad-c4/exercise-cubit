import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_screen/share_prefrence.dart';
import 'package:two_screen/view/home.dart';
import 'package:two_screen/cubit/counter_cubit.dart';
import 'cubit/cubit/thange_them_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تأكد من تشغيل النظام
  bool isLight = await SharePrefrenceClass().getTheme();
  ThemeData theTheme = ThemeData.light();

  if (isLight) {
    theTheme = ThemeData.light();
  } else {
    theTheme = ThemeData.dark();
  }

  int counter = await SharePrefrenceClass().getCounter(key: 'counter');
  runApp(MyApp(counter: counter, theTheme: theTheme));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.counter,
    required this.theTheme,
  });
  final int counter;
  ThemeData theTheme;
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
            SharePrefrenceClass().saveTheme(counter: false);
          } else if (state is ThangeThemChangeLight) {
            theTheme = ThemeData.light();
            SharePrefrenceClass().saveTheme(counter: true);
          } else if (state is ThemChange) {
            if (theTheme == ThemeData.dark()) {
              theTheme = ThemeData.light();
              SharePrefrenceClass().saveTheme(counter: true);
            } else {
              theTheme = ThemeData.dark();
              SharePrefrenceClass().saveTheme(counter: false);
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
