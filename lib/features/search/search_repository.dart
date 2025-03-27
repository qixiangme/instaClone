import 'package:mvvmclone/core/provider.dart';
import 'package:mvvmclone/data/api_service.dart';
import 'package:mvvmclone/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchRepository {
  final ApiService _apiService;
  SearchRepository(this._apiService);

  Future<List<UserModel>> searchUser() async {
    final users = await _apiService.getUser();
    return users;
  }
}

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return SearchRepository(apiService);
});
