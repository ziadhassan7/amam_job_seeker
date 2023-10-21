import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadSuccessProvider = StateNotifierProvider<UploadSuccessProvider, bool>((ref) {

  return UploadSuccessProvider();
});

class UploadSuccessProvider extends StateNotifier<bool>{

  UploadSuccessProvider() : super(false); //no success yet

  show() => state = true;
  hide() => state = false;

}