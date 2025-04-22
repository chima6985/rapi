import 'package:rapi_app/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rapi_app/user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

 final userLlistProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(apiServiceProvider).fetchUser() ;
 });


