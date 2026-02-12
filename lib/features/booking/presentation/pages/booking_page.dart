import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';
import '../bloc/booking_state.dart';
import 'create_booking_page.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BookingBloc>()..add(LoadBookings()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Bookings')),
        body: BlocBuilder<BookingBloc, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BookingLoaded) {
              return ListView.builder(
                itemCount: state.bookings.length,
                itemBuilder: (context, index) {
                  final booking = state.bookings[index];
                  return ListTile(
                    title: Text('R\$ ${booking.totalValue}'),
                    subtitle: Text('Data: ${booking.date}'),
                  );
                },
              );
            }

            if (state is BookingError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CreateBookingPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}