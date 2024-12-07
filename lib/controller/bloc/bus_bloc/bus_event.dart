part of 'bus_bloc.dart';

@immutable
sealed class BusEvent {}


class GetBusList extends BusEvent{
  final String routId;

  GetBusList({required this.routId});
}