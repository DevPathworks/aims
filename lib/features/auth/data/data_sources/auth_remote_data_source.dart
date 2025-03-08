import 'package:aims/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aims/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<UserModel> loginWithEmailPassword(String email, String password);
  Future<UserModel> signUpWithEmailPassword(String name, String email, String password);
  Future<UserModel?> getCurrentUser();
  Future<void> logout();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {

  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImplementation(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailPassword(String email, String password) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if(response.user == null) {
        throw const ServerException(message: 'User is empty');
      }

      return UserModel.fromJson(response.user!.toJson());

    } catch (e) {
      throw ServerException(message: 'Failed to login ${e.toString()}');
    }
  }

  @override
  Future<void> logout() {
    return supabaseClient.auth.signOut();
  }

  @override
  Future<UserModel> signUpWithEmailPassword(String name, String email, String password) async {
    try {

      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name, 
        }
      );

      if(response.user == null) {
        throw const ServerException(message: 'Failed to register');
      }

      return UserModel.fromJson(response.user!.toJson());

    } catch (e) {
      throw ServerException(message: 'Failed to register ${e.toString()}');
    }
  }
  
  @override
  Future<UserModel?> getCurrentUser() async {
    try {

      if(currentUserSession != null) {
          final userData = await supabaseClient.from('profiles').select().eq('id', currentUserSession!.user!.id);

          return UserModel.fromJson(userData.first).copyWith(email: currentUserSession!.user!.email);
      }

      return null;

    } catch (e) {
      throw ServerException(message: 'Failed to get current user ${e.toString()}');
    }
  }
  
}