import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadFailedProvider = StateNotifierProvider<UploadFailedProvider, bool>((ref) {

  return UploadFailedProvider();
});

class UploadFailedProvider extends StateNotifier<bool>{

  UploadFailedProvider() : super(false); //didn't fail

  show() => state = true;
  hide() => state = false;

}