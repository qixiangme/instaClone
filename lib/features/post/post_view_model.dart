import 'package:mvvmclone/core/provider.dart';
import 'package:riverpod/riverpod.dart';

import 'post_repository.dart';
import '../../data/models/post_model.dart';

class PostViewModel extends StateNotifier<AsyncValue<List<PostModel>>> {
  final PostRepository _postRepository;

  PostViewModel(this._postRepository) : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final posts = await _postRepository.getPosts();
      state = AsyncValue.data(posts);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final postViewModelProvider =
    StateNotifierProvider<PostViewModel, AsyncValue<List<PostModel>>>((ref) {
      final repository = ref.watch(PostRepositoryProvider);
      return PostViewModel(repository);
    });
