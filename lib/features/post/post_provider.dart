import 'package:riverpod/riverpod.dart';
import 'package:mvvmclone/core/provider.dart'; //api 불러오는 역할
import 'package:mvvmclone/data/models/post_model.dart';

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final posts = await apiService.getPost();
  return posts;
});
