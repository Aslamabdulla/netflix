part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool IsLoading,
    List<Downloads>? downloads,
    required Option<Either<MainFailures, List<Downloads>>>
        downloadsFailureOrSuccessOption,
  }) = _DownloadsState;
  factory DownloadsState.intial() {
    return const DownloadsState(
        IsLoading: false, downloadsFailureOrSuccessOption: None());
  }
}
