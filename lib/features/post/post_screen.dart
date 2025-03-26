import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmclone/features/home/home_page.dart';
import 'package:mvvmclone/features/post/post_provider.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postProvider);

    return Scaffold(
      body: posts.when(
        data: (posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              print(post.title);
              return ListTile(
                title: Text(post.title, style: TextStyle(color: Colors.black)),
                subtitle: Text(post.body),
              );
            },
          );

          return null;
        },
        error: (err, stack) => Text("에러 $err"),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}
