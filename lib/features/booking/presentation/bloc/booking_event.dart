import 'package:equatable/equatable.dart';

abstract class BookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBookings extends BookingEvent {}

class GetBookingByIdEvent extends BookingEvent {
  final String id;

  GetBookingByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class CreateBookingEvent extends BookingEvent {
  final dynamic booking;

  CreateBookingEvent(this.booking);

  @override
  List<Object?> get props => [booking];
}