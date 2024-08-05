import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_screen/share_prefrence.dart';
import 'package:two_screen/view/second_screen.dart';

import '../cubit/counter_cubit.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.counter});
  int counter ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Cubit'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state is CounterPlusOne) {
              counter++;
              SharePrefrenceClass().saveCounter(counter: counter);
            } else if (state is CounterMinusOne) {
              counter--;
              SharePrefrenceClass().saveCounter(counter: counter);
            } else if (state is CounterReset) {
              counter = 0;
              SharePrefrenceClass().saveCounter(counter: counter);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const Spacer(),
                Text(
                  '$counter',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () async {
                        BlocProvider.of<CounterCubit>(context).increment();
                        
                      },
                      icon: const Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).reset();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
                const Spacer()
              ],
            );
          },
        ),
      ),
    );
  }
}
