part of 'thange_them_cubit.dart';

@immutable
sealed class ThangeThemState {}

final class ThangeThemInitial extends ThangeThemState {}
class ThangeThemChangeDark extends ThangeThemState {}
class ThangeThemChangeLight extends ThangeThemState {}
class ThemChange extends ThangeThemState {}