import 'package:bloc_refresh/models/team_model.dart';

class FetchResult {
  final List<TeamModel> teams;
  final bool isRetrivedfromCache;
  const FetchResult({required this.teams, required this.isRetrivedfromCache});
}
