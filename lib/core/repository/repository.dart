import 'package:flutter/services.dart';

class Repository {
  Future getBible(path) async {
    return await rootBundle.loadString(path);


  }

}