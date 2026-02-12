import '../../domain/entities/booking.dart';

class BookingModel extends Booking {
  BookingModel({
    required super.id,
    required super.artistId,
    required super.contractorId,
    required super.date,
    required super.startTime,
    required super.totalValue,
    required super.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      artistId: json['artistId'],
      contractorId: json['contractorId'],
      date: DateTime.parse(json['date']),
      startTime: json['startTime'],
      totalValue: json['totalValue'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'artistId': artistId,
      'contractorId': contractorId,
      'date': date.toIso8601String(),
      'startTime': startTime,
      'totalValue': totalValue,
      'status': status,
    };
  }
}