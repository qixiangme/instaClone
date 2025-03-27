import 'package:mvvmclone/data/models/post_model.dart';
import 'package:mvvmclone/data/models/story_model.dart';
import 'package:mvvmclone/data/models/user_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/posts/{id}")
  Future<PostModel> getPostById(@Path("id") int id);
  @GET("/posts")
  Future<List<PostModel>> getPost();

  @GET("/photos")
  Future<List<StoryModel>> getStory();

  @GET("/users")
  Future<List<UserModel>> getUser();
}
