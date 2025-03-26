import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmclone/core/provider.dart';

import '../../data/api_service.dart';
import '../../data/models/story_model.dart';

class StoryRepository {
  final ApiService _apiService;

  StoryRepository({required ApiService apiService}) : _apiService = apiService;

  Future<List<StoryModel>> getStorys() async {
    final storys = _apiService.getStory();
    return storys;
  }
}

final storyRepositryProvider = Provider<StoryRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);

  return StoryRepository(apiService: apiService);
});
