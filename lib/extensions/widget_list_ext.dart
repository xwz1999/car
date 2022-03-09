import 'package:flutter/material.dart';

import 'num_ext.dart';

extension WidgetListExt on List<Widget> {
  List<Widget> sepWidget({Widget? separate}) {
    if (isEmpty) return [];
    return List.generate(length * 2 - 1, (index) {
      if (index.isEven) {
        return this[index ~/ 2];
      } else {
        return separate ?? 10.wb;
      }
    });
  }
}

extension OddListExt<T> on List<T> {
  List<T> oddList() {
    List<T> _newList = [];
    for (var element in this) {
      if (indexOf(element).isEven) {
        _newList.add(element);
      }
    }
    return _newList;
  }
}

extension EvenListExt<T> on List<T> {
  List<T> evenList() {
    List<T> _newList = [];
    forEach((element) {
      if (indexOf(element).isOdd) {
        _newList.add(element);
      }
    });
    return _newList;
  }
}
