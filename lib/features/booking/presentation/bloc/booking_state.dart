import 'package:equatable/equatable.dart';
import '../../domain/entities/booking.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<Booking> bookings;

  BookingLoaded(this.bookings);

  @override
  List<Object?> get props => [bookings];
}

class BookingSingleLoaded extends BookingState {
  final Booking booking;

  BookingSingleLoaded(this.booking);

  @override
  List<Object?> get props => [booking];
}

class BookingCreated extends BookingState {
  final Booking booking;

  BookingCreated(this.booking);

  @override
  List<Object?> get props => [booking];
}

class BookingError extends BookingState {
  final String message;

  BookingError(this.message);

  @override
  List<Object?> get props => [message];
}