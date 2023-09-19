import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final countChange = ChangeNotifierProvider((ref) => ChangeCount());


class ChangeCount extends ChangeNotifier {

  int number = 0;


  void increment(){
    number++;
    notifyListeners();
  }

  void decrement(){
    number--;
    notifyListeners();
  }

}