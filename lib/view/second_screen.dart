import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_screen/cubit/cubit/thange_them_cubit.dart';
import 'package:two_screen/main.dart';
import 'package:two_screen/view/home.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('change theme Screen'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<ThangeThemCubit>(context).changeThem();
          },
          child: const Text('change theme'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<ThangeThemCubit>(context).changeThemeToDark();
          },
          child: const Text('change Dark'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<ThangeThemCubit>(context).changeThemeToLight();
          },
          child: const Text('change Light'),
        ),
      ])),
    );
  }
}
