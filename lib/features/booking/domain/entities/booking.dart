class Booking {
  final String id;
  final int artistId;
  final int contractorId;
  final DateTime date;
  final String startTime;
  final double totalValue;
  final int status;

  const Booking({
    required this.id,
    required this.artistId,
    required this.contractorId,
    required this.date,
    required this.startTime,
    required this.totalValue,
    required this.status,
  });
}