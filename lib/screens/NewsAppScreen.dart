import 'package:day12_newapp_using_dio_json/models/NewsAppApiModel.dart';
import 'package:day12_newapp_using_dio_json/services/NewsApiService.dart';
import 'package:flutter/material.dart';

class NewsAppScreen extends StatefulWidget {
  NewsAppScreenState createState() {
    return NewsAppScreenState();
  }
}

class NewsAppScreenState extends State<NewsAppScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "News ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text("Find every news Here", style: TextStyle(fontSize: 14)),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<Article>>(
                // future: NewsAppApiModel().getDetails(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView(
                      children: [
                          ...snapshot.data!.map((e) => ListTile(
                          title: Text(e.title),
                          subtitle: Text(e.description),
                        )
                      )
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
