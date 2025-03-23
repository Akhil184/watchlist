import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:watchlist/screens/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qsyzyljqpqvcbonqlczh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFzeXp5bGpxcHF2Y2JvbnFsY3poIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI3MzA4NjMsImV4cCI6MjA1ODMwNjg2M30.acH1q1fOdKxDq_PMu_8pcBgTdeRpXn3WEHZPAiu-GQs',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 852), // Adjust based on your design
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child:SplashScreen(),
    );
  }
}
