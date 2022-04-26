import '../constants/api/api.dart';

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
}
