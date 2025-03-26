import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmclone/core/provider.dart';
import '../../data/models/post_model.dart';
import '../../data/api_service.dart';

class PostRepository {
  final ApiService _apiService;
  PostRepository(this._apiService);

  Future<List<PostModel>> getPosts() async {
    return await _apiService.getPost();
  }
}
final postRepositoryProvider = Provider<PostRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return PostRepository(apiService);
});