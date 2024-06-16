import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageProvider extends ChangeNotifier {
  Uint8List? _imageData;

  Uint8List? get imageData => _imageData;

  void setImageData(Uint8List? imageData) {
    _imageData = imageData;
    notifyListeners();
  }
}
