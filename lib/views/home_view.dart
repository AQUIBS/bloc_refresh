import 'dart:async';

import 'package:bloc_refresh/cubits/cubits.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final NameCubits cubits;
  @override
  void initState() {
    cubits = NameCubits();
    automizer();
    super.initState();
  }

  @override
  void dispose() {
    cubits.close();
    super.dispose();
  }

  void automizer() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (timer.isActive) {
        cubits.pickRandomName();
        if (timer.tick == 30) {
          timer.cancel();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bloc  Refresh"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => automizer(),
        child: const Icon(Icons.replay_outlined),
      ),
      body: Container(
        alignment: Alignment.center,
        child: StreamBuilder<String?>(
            stream: cubits.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "${snapshot.data}",
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                );
              } else {
                return Text("${snapshot.connectionState}");
              }
            }),
      ),
    );
  }
}
