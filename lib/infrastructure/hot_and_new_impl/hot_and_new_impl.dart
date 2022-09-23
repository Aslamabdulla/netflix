import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/core/api-end_points.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';
import 'package:netflix/domain/search/model/search_response/search_response.dart';

@LazySingleton(as: HotAndnewService)
class HotAndNewImplementation implements HotAndnewService {
  @override
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNwMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNwTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTV,
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
