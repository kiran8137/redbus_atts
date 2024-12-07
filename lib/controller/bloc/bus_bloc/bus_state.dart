part of 'bus_bloc.dart';

@immutable
sealed class BusState {}

final class BusInitial extends BusState {}

final class BusListSuccess extends BusState{
  final List<BusModel> busList;

  BusListSuccess({required this.busList});


}

final class BusListError extends BusState{}

final class BusListEmpty extends BusState{}
