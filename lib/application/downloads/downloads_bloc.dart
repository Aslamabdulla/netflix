import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/domain/i_sownloads_repo.dart';

import '../../domain/downloads/models/downloads_file.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.intial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(state.copyWith(
          IsLoading: true, downloadsFailureOrSuccessOption: None()));
      final Either<MainFailures, List<Downloads>> downloadsoption =
          await _downloadsRepo.getDownloadsImages();
      emit(downloadsoption.fold(
          (failure) => state.copyWith(
              IsLoading: false,
              downloadsFailureOrSuccessOption: Some(Left(failure))),
          (success) => state.copyWith(
              IsLoading: false,
              downloads: success,
              downloadsFailureOrSuccessOption: Some(Right(success)))));
    });
  }
}
