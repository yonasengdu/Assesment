import 'package:assesment/core/routes/routing_config.dart';
import 'package:assesment/features/hospital/presentation/bloc/hospital_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assesment/features/dependency_injection.dart' as di;

void main() async {
  await di.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<HospitalBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'assesment',
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
