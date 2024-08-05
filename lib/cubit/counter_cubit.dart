import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:two_screen/share_prefrence.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  Future<int> counter = SharePrefrenceClass().getCounter(key: 'counter');
  void decrement() {
   
    emit(CounterMinusOne());
  }

  void reset() {
    
    emit(CounterReset());
  }

  void increment() {
    
    emit(CounterPlusOne());
  }
}
