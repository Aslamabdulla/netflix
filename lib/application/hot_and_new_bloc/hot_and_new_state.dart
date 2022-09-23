part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOneWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HotAndNewState.intial() => HotAndNewState(
      comingSoonList: [],
      everyOneWatchingList: [],
      hasError: false,
      isLoading: false);
}
