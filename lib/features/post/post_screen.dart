import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmclone/features/post/provider/post_provider.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postProvider);
    return posts.when(
      data: (posts) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.title),
            );
          },
        );
      },
      error: (err, stack) => Text("data $err"),
      loading: () => CircularProgressIndicator(),
    );
  }
}
