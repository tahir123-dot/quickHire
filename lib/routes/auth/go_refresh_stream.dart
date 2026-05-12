import 'dart:async';

import 'package:flutter/material.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  final Stream<dynamic> stream;

  late final StreamSubscription _sub;

  GoRouterRefreshStream(this.stream) {
    _sub = stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
