import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingModel>> getAllBookings();
  Future<BookingModel> getBookingById(String id);
  Future<BookingModel> createBooking(BookingModel booking);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final http.Client client;

  BookingRemoteDataSourceImpl(this.client);

  final baseUrl = 'http://localhost:5249/api/bookings';

  @override
  Future<List<BookingModel>> getAllBookings() async {
    final response = await client.get(Uri.parse(baseUrl));

    final List decoded = json.decode(response.body);

    return decoded
        .map((json) => BookingModel.fromJson(json))
        .toList();
  }

  @override
  Future<BookingModel> getBookingById(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/$id'));

    final decoded = json.decode(response.body);

    return BookingModel.fromJson(decoded);
  }

  @override
  Future<BookingModel> createBooking(BookingModel booking) async {
    final response = await client.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(booking.toJson()),
    );

    final decoded = json.decode(response.body);

    return BookingModel.fromJson(decoded);
  }
}