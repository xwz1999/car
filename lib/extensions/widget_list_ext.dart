import 'package:flutter/material.dart';

import 'num_ext.dart';

extension WidgetListExt<T> on List<T> {
  List<T> sep(T sep) => _sepIterable(sep).toList();

  Iterable<T> _sepIterable(T separate) sync* {
    final it = iterator;
    if (!it.moveNext()) return;
    yield it.current;
    while (it.moveNext()) {
      yield separate;
      yield it.current;
    }
  }
}

extension OddListExt<T> on List<T> {
  List<T> oddList() {
    List<T> newList = [];
    for (var element in this) {
      if (indexOf(element).isEven) {
        newList.add(element);
      }
    }
    return newList;
  }
}

extension EvenListExt<T> on List<T> {
  List<T> evenList() {
    List<T> newList = [];
    forEach((element) {
      if (indexOf(element).isOdd) {
        newList.add(element);
      }
    });
    return newList;
  }
}
