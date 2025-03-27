import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmclone/features/search/search_repository.dart';
import 'package:mvvmclone/data/models/user_model.dart';

class SearchViewModel extends StateNotifier<List<UserModel>> {
  final SearchRepository _repository;

  SearchViewModel(this._repository) : super([]);

  Future<void> searchUsers() async {
    try {
      final users = await _repository.searchUser();
      state = users;
    } catch (e) {
      state = [];
    }
  }
}

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, List<UserModel>>((ref) {
      final repository = ref.watch(searchRepositoryProvider);
      return SearchViewModel(repository);
    });
