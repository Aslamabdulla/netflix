import 'package:dio/dio.dart';
import 'package:netflix/domain/downloads/core/api-end_points.dart';
import 'package:netflix/domain/downloads/models/downloads_file.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/i_sownloads_repo.dart';

class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadList = [];
        for (final raw in response.data) {
          downloadList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadList);
        return Right(downloadList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
