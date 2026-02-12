import 'package:flutter/material.dart';
import 'features/booking/presentation/pages/booking_page.dart';
import 'features/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mixart',
      debugShowCheckedModeBanner: false,
      home: const BookingPage(),
    );
  }
}