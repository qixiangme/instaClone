import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'post_view_model.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: posts.when(
        data:
            (posts) => ListView.builder(
              itemCount: posts.length, // ✅ itemCount 추가
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(
                    post.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(post.body), // ✅ post.title → post.body 변경
                );
              },
            ),
        error:
            (err, stack) => Center(
              child: Text(
                "에러 발생: $err",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
        loading: () => Center(child: CircularProgressIndicator()), // ✅ 가운데 정렬
      ),
    );
  }
}
