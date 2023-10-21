import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadLoadingProvider = StateNotifierProvider<UploadLoadingProvider, bool>((ref) {

  return UploadLoadingProvider();
});

class UploadLoadingProvider extends StateNotifier<bool>{

  UploadLoadingProvider() : super(false); //not loading

  loading() => state = true;
  done() => state = false;

}