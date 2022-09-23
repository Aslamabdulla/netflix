import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndnewService _hotAndnewService;
  HotAndNewBloc(this._hotAndnewService) : super(HotAndNewState.intial()) {
    on<LoadDataInComingsoon>((event, emit) async {
      emit(HotAndNewState(
          comingSoonList: [],
          everyOneWatchingList: [],
          isLoading: true,
          hasError: false));
      /////data to state
      ///
      final _result = await _hotAndnewService.getHotAndNwMovieData();
      final newState = _result.fold(
          (MainFailures failures) => HotAndNewState(
              comingSoonList: [],
              everyOneWatchingList: [],
              isLoading: false,
              hasError: true),
          (HotAndNewResp resp) => HotAndNewState(
              comingSoonList: resp.results,
              everyOneWatchingList: state.everyOneWatchingList,
              isLoading: false,
              hasError: false));
      emit(newState);
    });
    on<LoadDataEveryOneswatching>((event, emit) async {});
  }
}
