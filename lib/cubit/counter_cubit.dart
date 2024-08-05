import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int counter = 0;
  void decrement() {
    counter--;
    emit(CounterMinusOne());
  }

  void reset() {
    counter = 0;
    emit(CounterReset());
  }

  void increment() {
    counter++;
    emit(CounterPlusOne());
  }
}
