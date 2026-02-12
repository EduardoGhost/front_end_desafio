import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../domain/entities/booking.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';
import '../bloc/booking_state.dart';

class CreateBookingPage extends StatefulWidget {
  const CreateBookingPage({super.key});

  @override
  State<CreateBookingPage> createState() => _CreateBookingPageState();
}

class _CreateBookingPageState extends State<CreateBookingPage> {
  final _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BookingBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Criar Booking')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _valueController,
                decoration: const InputDecoration(labelText: 'Valor'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final booking = Booking(
                    id: '',
                    artistId: 1,
                    contractorId: 1,
                    date: DateTime.now(),
                    startTime: '20:00:00',
                    totalValue: double.parse(_valueController.text),
                    status: 1,
                  );

                  context.read<BookingBloc>().add(
                    CreateBookingEvent(booking),
                  );
                },
                child: const Text('Criar'),
              ),
              const SizedBox(height: 20),
              BlocListener<BookingBloc, BookingState>(
                listener: (context, state) {
                  if (state is BookingCreated) {
                    Navigator.pop(context);
                  }
                },
                child: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}