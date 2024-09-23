import 'package:cricscore/model/cricket_score_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseDatabase database = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: "https://cricscore-20121-default-rtdb.firebaseio.com");

  late final stream = FirebaseDatabase.instance.ref('score/matchId1').onValue;

  @override
  void initState() {
    // addDummyScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "CricScore",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      body: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong."),
              );
            }
            if (snapshot.hasData) {
              final myJson = Map<String, dynamic>.from(
                  snapshot.data?.snapshot.value as Map);
              CricketScoreModel score = CricketScoreModel.fromJson(myJson);

              return _scoreDetails(score);
            }

            return Container();
          }),
    );
  }

  _scoreDetails(CricketScoreModel score) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(score.matchVenue ?? ''),
              Text(score.matchType ?? ''),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(score.teamA ?? ''),
              Text(score.firstInnings ?? 'N/A'),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(score.teamB ?? ''),
              Text(score.secondInnings ?? 'N/A'),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(score.matchResults ?? '',style: TextStyle(fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }

  addDummyScore() async {
    Map<String, dynamic> score = {
      "match_type": "T20",
      "teamA": "IND",
      "teamB": "AUS",
      "first_innings": "",
      "second_innings": "",
      "match_venue": "Kolkata",
      "match_results": "Match delayed"
    };
    try {
      DatabaseReference ref = database.ref("score/matchId1");
      await ref.set(score);
      print("success");
    } catch (e) {
      print(e.toString());
    }
  }
}
