import 'package:rapi_app/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rapi_app/create_user_model.dart';
import 'package:rapi_app/user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

 final userLlistProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(apiServiceProvider).fetchUser() ;
 });

 final UserProvider = StateNotifierProvider<UserNotifier, CreateUser?>((ref) {
  return UserNotifier(ref.read(apiServiceProvider));
 });

class UserNotifier extends StateNotifier<CreateUser?> {
  final ApiService apiService;
  UserNotifier(this.apiService): super(null);

  Future<void>createUser(String name, String job)async{
    try{
     final user = await apiService.createUser(name, job);
      state = user;
    }
    catch (e){
      state = null;
    }
  }
  
}
