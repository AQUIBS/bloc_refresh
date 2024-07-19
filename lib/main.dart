import 'package:bloc_refresh/bloc/teams_bloc.dart';
import 'package:bloc_refresh/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: BlocProvider(
        create: (_) => TeamBloc(),
        child: const HomeView(),
      ),
    );
  }
}
