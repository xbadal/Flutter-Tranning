class CricketScoreModel {
  String? matchType;
  String? teamA;
  String? teamB;
  String? firstInnings;
  String? secondInnings;
  String? matchVenue;
  String? matchResults;

  CricketScoreModel(
      {this.matchType,
        this.teamA,
        this.teamB,
        this.firstInnings,
        this.secondInnings,
        this.matchVenue,
        this.matchResults});

  CricketScoreModel.fromJson(Map<String, dynamic> json) {
    matchType = json['match_type'];
    teamA = json['teamA'];
    teamB = json['teamB'];
    firstInnings = json['first_innings'];
    secondInnings = json['second_innings'];
    matchVenue = json['match_venue'];
    matchResults = json['match_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_type'] = this.matchType;
    data['teamA'] = this.teamA;
    data['teamB'] = this.teamB;
    data['first_innings'] = this.firstInnings;
    data['second_innings'] = this.secondInnings;
    data['match_venue'] = this.matchVenue;
    data['match_results'] = this.matchResults;
    return data;
  }
}