import 'package:dartz/dartz.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/models/downloads_file.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages();
}
