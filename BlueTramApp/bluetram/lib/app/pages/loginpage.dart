import 'package:flutter/material.dart';
import 'package:bluetram/app/services/httpallmovesobject.dart';
import 'package:http/http.dart' as http;

//purpose of this page is to check if the json parse works.
class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
            onPressed: () => {fetchAllMoves()},
            child: Text("this is a placeholder")));
  }
}

Future<AllMoves> fetchAllMoves() async {
  final response = await http
      .get(Uri.parse('https://online-go.com/api/v1/players/1113291/full'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    final allMoves = AllMoves.fromRawJson(response.body);
    print(allMoves.activeGames![0].json!.moves![0]);
    return allMoves;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
