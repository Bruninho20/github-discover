import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/repository_model.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';

abstract class RepositoryRemoteDataSource {
  Future<RepositoryModel> getRepository(String name);

  Future<List<RepositoryModel>> getRepos({String? search});
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final Dio dio;

  RepositoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RepositoryModel>> getRepos({String? search}) async {}

  @override
  Future<RepositoryModel> getRepository(String name) async {
       final response = await dio.get(
      '${Env.baseUrl}${Endpoint.profile}',
    );

    if (response.statusCode == HttpStatus.ok) {
      return RepositoryModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
