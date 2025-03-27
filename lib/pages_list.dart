import 'package:flutter/widgets.dart';
import 'package:mvvmclone/features/search/search_screen.dart';
import './features/post/post_screen.dart';

List pages = [
  const PostScreen(),
  const SearchScreen(),
  const Center(child: Text("upload")),
  const Center(child: Text("Home")),
  const Center(child: Text("Home")),
  const Center(child: Text("Home")),
];
