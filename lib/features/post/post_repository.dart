import 'package:mvvmclone/core/provider.dart';
import 'package:mvvmclone/data/models/post_model.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/api_service.dart';
import '../../data/models/post_model.dart';

class PostRepository {
  final ApiService _apiservice;

  PostRepository(this._apiservice);

  Future<List<PostModel>> getPosts() async {
    final posts = await _apiservice.getPost();
    return posts;
  }
}

final PostRepositoryProvider = Provider<PostRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return PostRepository(apiService);
});
