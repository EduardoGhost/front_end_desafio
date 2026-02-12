import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usercases/create_booking.dart';
import '../../domain/usercases/get_all_bookings.dart';
import '../../domain/usercases/get_booking_by_id.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetAllBookings getAllBookings;
  final GetBookingById getBookingById;
  final CreateBooking createBooking;

  BookingBloc({
    required this.getAllBookings,
    required this.getBookingById,
    required this.createBooking,
  }) : super(BookingInitial()) {
    on<LoadBookings>(_onLoadBookings);
    on<GetBookingByIdEvent>(_onGetBookingById);
    on<CreateBookingEvent>(_onCreateBooking);
  }

  Future<void> _onLoadBookings(
      LoadBookings event,
      Emitter<BookingState> emit,
      ) async {
    emit(BookingLoading());
    try {
      final bookings = await getAllBookings();
      emit(BookingLoaded(bookings));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  Future<void> _onGetBookingById(
      GetBookingByIdEvent event,
      Emitter<BookingState> emit,
      ) async {
    emit(BookingLoading());
    try {
      final booking = await getBookingById(event.id);
      emit(BookingSingleLoaded(booking));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  Future<void> _onCreateBooking(
      CreateBookingEvent event,
      Emitter<BookingState> emit,
      ) async {
    emit(BookingLoading());
    try {
      final booking = await createBooking(event.booking);
      emit(BookingCreated(booking));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }
}