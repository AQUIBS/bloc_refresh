import 'dart:math' as math show Random;

import 'package:bloc/bloc.dart';
import 'package:bloc_refresh/constant/const.dart';

extension RamdomElement<T> on Iterable<T> {
  T getRandonElement() => elementAt(math.Random().nextInt(length));
}

class NameCubits extends Cubit<String?> {
  NameCubits() : super(null);

  void pickRandomName() => emit(Constants.name.getRandonElement());
}
