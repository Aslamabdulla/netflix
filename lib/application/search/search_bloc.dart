import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/models/downloads_file.dart';
import 'package:netflix/domain/i_sownloads_repo.dart';
import 'package:netflix/domain/search/model/search_response/search_response.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    on<Intialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoding: false,
            isError: false));
        return;
      }
      emit(SearchState(
          searchResultList: [], idleList: [], isLoding: true, isError: false));
      final result = await _downloadService.getDownloadsImages();
      log(result.toString());
      final _state = result.fold(
          (MainFailures f) => SearchState(
              searchResultList: [],
              idleList: [],
              isLoding: false,
              isError: true),
          (List<Downloads> list) => SearchState(
              searchResultList: [],
              idleList: list,
              isLoding: false,
              isError: false));
      emit(_state);
    });

    on<SearchMovie>((event, emit) async {
      // log(event.movieQuery);
      emit(SearchState(
          searchResultList: [], idleList: [], isLoding: true, isError: false));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
          (MainFailures f) => SearchState(
              searchResultList: [],
              idleList: [],
              isLoding: false,
              isError: true),
          (SearchResponse r) => SearchState(
              searchResultList: r.results,
              idleList: [],
              isLoding: false,
              isError: false));
      emit(_state);
    });
  }
}
