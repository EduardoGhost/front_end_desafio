import '../entities/booking.dart';

abstract class BookingRepository {
  Future<List<Booking>> getAllBookings();

  Future<Booking> getBookingById(String id);

  Future<Booking> createBooking(Booking booking);
}