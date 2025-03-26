import 'package:flutter/material.dart';

import 'story_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/story_model.dart';

class StoryViewModel extends StateNotifier<AsyncValue<List<StoryModel>>> {
  final StoryRepository _storyRepository;

  StoryViewModel(this._storyRepository) : super(const AsyncValue.loading()) {
    fetchStorys();
  }
  Future<void> fetchStorys() async {
    try {
      final storys = await _storyRepository.getStorys();
      state = AsyncValue.data(storys);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final storyViewModelProvider =
    StateNotifierProvider<StoryViewModel, AsyncValue<List<StoryModel>>>((ref) {
      final storyViewModel = ref.watch(storyRepositryProvider);
      return StoryViewModel(storyViewModel);
    });
