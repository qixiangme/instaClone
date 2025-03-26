import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmclone/core/provider.dart';
import 'package:mvvmclone/data/models/post_model.dart';
import '../../../data/api_service.dart';

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final posts = await apiService.getPost();
  return posts;
});
