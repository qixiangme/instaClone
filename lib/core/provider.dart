import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';

import '../data/api_service.dart';

final dioProvider = Provider<Dio>((ref) => Dio()); // Dio를 구독하는 Provider


//APISERVICE -> GET method 존재

final apiServiceProvider = Provider<ApiService>((ref) { //APISERVICE 구독하는 Provider
  final dio = ref.watch(dioProvider);  //DIO watch to 구독
  return ApiService(dio); //APIservice( 구독하는 Dio )
});