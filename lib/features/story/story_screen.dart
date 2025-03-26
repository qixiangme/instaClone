import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'story_view_model.dart';
import '../../data/models/story_model.dart';

class StoryScreen extends ConsumerWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storys = ref.watch(storyViewModelProvider);
    return storys.when(
      data: (storys) {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,

          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  CircleAvatar(radius: 30),
                  Text(storys[index].id.toString()),
                ],
              ),
            );
          },
        );
      },
      error: (error, stack) => Text("data $error"),
      loading: () => CircularProgressIndicator(),
    );
  }
}
