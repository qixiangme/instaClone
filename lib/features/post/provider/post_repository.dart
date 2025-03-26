import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/post_model.dart';
import '../../../data/api_service.dart';

class PostRepository {
  final ApiService _apiService;
  PostRepository(this._apiService);

  Future<List<PostModel>> getPosts() async {
    return await _apiService.getPost();
  }
}
