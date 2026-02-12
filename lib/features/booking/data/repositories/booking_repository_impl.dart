import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasource/booking_remote_datasource.dart';
import '../models/booking_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Booking>> getAllBookings() {
    return remoteDataSource.getAllBookings();
  }

  @override
  Future<Booking> getBookingById(String id) {
    return remoteDataSource.getBookingById(id);
  }

  @override
  Future<Booking> createBooking(Booking booking) {
    final model = BookingModel(
      id: booking.id,
      artistId: booking.artistId,
      contractorId: booking.contractorId,
      date: booking.date,
      startTime: booking.startTime,
      totalValue: booking.totalValue,
      status: booking.status,
    );

    return remoteDataSource.createBooking(model);
  }
}