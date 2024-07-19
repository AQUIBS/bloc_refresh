import 'package:bloc/bloc.dart';
import 'package:bloc_refresh/bloc/event_bloc.dart';
import 'package:bloc_refresh/bloc/state_bloc.dart';
import 'package:bloc_refresh/constant/constant.dart';
import 'package:bloc_refresh/models/team_model.dart';
import 'package:bloc_refresh/repository/team_repo.dart';

class TeamBloc extends Bloc<LoadTeamAction, FetchResult?> {
  final Map<Team, List<TeamModel>> _cache = {};
  TeamBloc() : super(null) {
    on<LoadTeamAction>((event, emit) async {
      /// we have the value in the cache
      final teams = event.team;
      if (_cache.containsKey(teams)) {
        emit(FetchResult(teams: _cache[teams]!, isRetrivedfromCache: true));
      } else {
        /// we don't have the value in the cache
        final result = await TeamRepository().getTeamData(teams.urlString);
        _cache[teams] = result;
        emit(FetchResult(teams: result, isRetrivedfromCache: false));
      }
    });
  }
}
