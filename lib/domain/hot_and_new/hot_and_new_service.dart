import 'package:dartz/dartz.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

abstract class HotAndnewService {
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNwMovieData();
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNwTvData();
}
