import 'dart:ui';

class BodyPartModel {
  final String id;
  final String name;
  final String pathData;
  Path? _cachedPath;

  BodyPartModel({required this.id, required this.name, required this.pathData});

  Path get path {
    _cachedPath ??= _parseSvgPath(pathData);
    return _cachedPath!;
  }

  static Path _parseSvgPath(String pathData) {
    final path = Path();
    _parsePath(pathData, path);
    return path;
  }

  static void _parsePath(String d, Path path) {
    final RegExp tokenRe = RegExp(r'([MmLlCcSsQqTtAaZzHhVv])|(-?\d+\.?\d*(?:e[+-]?\d+)?)');
    final tokens = tokenRe.allMatches(d).map((m) => m.group(0)!).toList();

    double cx = 0, cy = 0;
    double? prevCpX, prevCpY;
    String cmd = 'M';
    int i = 0;

    double nextNum() => double.parse(tokens[i++]);

    while (i < tokens.length) {
      final t = tokens[i];
      if (RegExp(r'[MmLlCcSsQqTtAaZzHhVv]').hasMatch(t)) {
        cmd = t;
        i++;
        prevCpX = prevCpY = null;
      }

      switch (cmd) {
        case 'M':
          cx = nextNum();
          cy = nextNum();
          path.moveTo(cx, cy);
          cmd = 'L';
          break;
        case 'm':
          cx += nextNum();
          cy += nextNum();
          path.moveTo(cx, cy);
          cmd = 'l';
          break;
        case 'L':
          cx = nextNum();
          cy = nextNum();
          path.lineTo(cx, cy);
          break;
        case 'l':
          cx += nextNum();
          cy += nextNum();
          path.lineTo(cx, cy);
          break;
        case 'H':
          cx = nextNum();
          path.lineTo(cx, cy);
          break;
        case 'h':
          cx += nextNum();
          path.lineTo(cx, cy);
          break;
        case 'V':
          cy = nextNum();
          path.lineTo(cx, cy);
          break;
        case 'v':
          cy += nextNum();
          path.lineTo(cx, cy);
          break;
        case 'C':
          final x1 = nextNum(), y1 = nextNum();
          final x2 = nextNum(), y2 = nextNum();
          final x = nextNum(), y = nextNum();
          path.cubicTo(x1, y1, x2, y2, x, y);
          prevCpX = x2;
          prevCpY = y2;
          cx = x;
          cy = y;
          break;
        case 'c':
          final x1 = cx + nextNum(), y1 = cy + nextNum();
          final x2 = cx + nextNum(), y2 = cy + nextNum();
          final x = cx + nextNum(), y = cy + nextNum();
          path.cubicTo(x1, y1, x2, y2, x, y);
          prevCpX = x2;
          prevCpY = y2;
          cx = x;
          cy = y;
          break;
        case 'S':
          final cpX = prevCpX != null ? 2 * cx - prevCpX : cx;
          final cpY = prevCpY != null ? 2 * cy - prevCpY : cy;
          final x2 = nextNum(), y2 = nextNum();
          final x = nextNum(), y = nextNum();
          path.cubicTo(cpX, cpY, x2, y2, x, y);
          prevCpX = x2;
          prevCpY = y2;
          cx = x;
          cy = y;
          break;
        case 's':
          final cpX = prevCpX != null ? 2 * cx - prevCpX : cx;
          final cpY = prevCpY != null ? 2 * cy - prevCpY : cy;
          final x2 = cx + nextNum(), y2 = cy + nextNum();
          final x = cx + nextNum(), y = cy + nextNum();
          path.cubicTo(cpX, cpY, x2, y2, x, y);
          prevCpX = x2;
          prevCpY = y2;
          cx = x;
          cy = y;
          break;
        case 'Q':
          final x1 = nextNum(), y1 = nextNum();
          final x = nextNum(), y = nextNum();
          path.quadraticBezierTo(x1, y1, x, y);
          prevCpX = x1;
          prevCpY = y1;
          cx = x;
          cy = y;
          break;
        case 'q':
          final x1 = cx + nextNum(), y1 = cy + nextNum();
          final x = cx + nextNum(), y = cy + nextNum();
          path.quadraticBezierTo(x1, y1, x, y);
          prevCpX = x1;
          prevCpY = y1;
          cx = x;
          cy = y;
          break;
        case 'Z':
        case 'z':
          path.close();
          break;
        default:
          if (i < tokens.length && RegExp(r'-?\d').hasMatch(tokens[i][0])) {
            i++;
          } else {
            i++;
          }
      }
    }
  }
}
