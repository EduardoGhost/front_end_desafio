import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../booking/data/datasource/booking_remote_datasource.dart';
import '../../booking/data/repositories/booking_repository_impl.dart';
import '../../booking/domain/usercases/create_booking.dart';
import '../../booking/domain/usercases/get_all_bookings.dart';
import '../../booking/domain/usercases/get_booking_by_id.dart';
import '../../booking/presentation/bloc/booking_bloc.dart';
import '../../booking/domain/repositories/booking_repository.dart';



final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => http.Client());

  // DataSource
  sl.registerLazySingleton<BookingRemoteDataSource>(
        () => BookingRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<BookingRepository>(
        () => BookingRepositoryImpl(sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllBookings(sl()));
  sl.registerLazySingleton(() => GetBookingById(sl()));
  sl.registerLazySingleton(() => CreateBooking(sl()));

  // Bloc
  sl.registerFactory(
        () => BookingBloc(
      getAllBookings: sl(),
      getBookingById: sl(),
      createBooking: sl(),
    ),
  );
}