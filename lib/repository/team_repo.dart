import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc_refresh/models/team_model.dart';

class TeamRepository {
  Future<List<TeamModel>> getTeamData(String teamsUrl) async {
    final url = Uri.parse(teamsUrl);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return _stringToModel(response.body);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  List<TeamModel> _stringToModel(String response) {
    List<TeamModel> model = [];
    List<dynamic> json = jsonDecode(response);
    for (var element in json) {
      model.add(TeamModel.fromJson(element));
    }
    return model;
  }
}
