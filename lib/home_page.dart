import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/constraints/newsCard.dart';

import 'constraints/constraints.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _fetchNews() async {
    var url = Uri.parse(News_api_URL);
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News Headlines"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: FutureBuilder(
                future: _fetchNews(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        ...snapshot.data["results"].map(
                            (e) => getNewsCard(e))
                      ],
                    );
                    //
                  } else {
                    return const CircularProgressIndicator();
                  }
                })),
      ),
    );
  }
}
