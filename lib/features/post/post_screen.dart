import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmclone/features/home/home_page.dart';
import 'package:mvvmclone/features/post/post_view_model.dart';
import 'package:mvvmclone/features/post/widgets/postTile.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postViewModelProvider);

    return Scaffold(
      body: posts.when(
        data: (posts) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Posttile(userId: post.id, textcontext: post.title);
            },
          );
        },
        error: (err, stack) => Text("에러 $err"),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}
