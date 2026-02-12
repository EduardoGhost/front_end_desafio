import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetBookingById {
  final BookingRepository repository;

  GetBookingById(this.repository);

  Future<Booking> call(String id) {
    return repository.getBookingById(id);
  }
}