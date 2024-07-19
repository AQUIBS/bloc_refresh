import 'package:bloc_refresh/constant/constant.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LaodActions {
  const LaodActions();
}

class LoadTeamAction implements LaodActions {
  final Team team;
  const LoadTeamAction({required this.team}) : super();
}
