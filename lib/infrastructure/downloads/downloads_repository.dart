import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/core/api-end_points.dart';
import 'package:netflix/domain/downloads/models/downloads_file.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/i_sownloads_repo.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.data['results'] as List)
            .map(
              (e) => Downloads.fromJson(e),
            )
            .toList();

        print(response.data);
        return Right(downloadList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
