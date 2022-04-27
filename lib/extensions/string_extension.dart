import '../constants/api/api.dart';
import 'package:lpinyin/lpinyin.dart';

extension ImageOnString on String? {
  String get imageWithHost => '${API.imageHost}/$this';

  String sizeImage(int width, [int? height]) {
    var parts = <String>[];
    parts.add('w=$width');
    if (height != null) parts.add('h=$height');
    return '$imageWithHost@${parts.join('&')}';
  }

  String get toSnake {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    if (this == null) {
      return '';
    }
    return this!
        .replaceAllMapped(exp, (Match m) => ('_' + m.group(0)!))
        .toLowerCase();
  }

  String get pinyin => PinyinHelper.getPinyinE(this ?? '');

  String get tag => pinyin.substring(0, 1).toUpperCase();

  int get minPrice {
    if (this == null || this!.isEmpty) {
      return 0;
    } else if (this!.contains('不限')) {
      return 0;
    } else if (this!.contains('以下')) {
      return 0;
    } else if (this!.contains('以上')) {
      return int.parse(this!.substring(0, this!.length - 3)) * 10000;
    } else {
      {
        var list = this!.split('-');
        return int.parse(list[0]) * 10000;
      }
    }
  }

  int get maxPrice {
    if (this == null || this!.isEmpty) {
      return 0;
    } else if (this!.contains('不限')) {
      return 0;
    } else if (this!.contains('以下')) {
      return int.parse(this!.substring(0, this!.length - 3)) * 10000;
    }
    if (this!.contains('以上')) {
      return 0;
    } else {
      var list = this!.split('-');
      return int.parse(list[1].substring(0, list[1].length - 1)) * 10000;
    }
  }

  int get maxMile {
    if (this == null || this!.isEmpty) {
      return 0;
    } else {
      return int.parse(this!.substring(0, this!.length - 4));
    }
  }
}
