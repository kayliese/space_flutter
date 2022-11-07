import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_app/pages/navpages/articledetailpage.dart';

class ArticlePage extends StatelessWidget {
  fetchArticles() async {
    var url;
    url = await http
        .get(Uri.parse("https://api.spaceflightnewsapi.net/v3/articles"));
    return json.decode(url.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191826),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'ARTICLES',
          style: TextStyle(fontSize: 25.0, color: Color(0xfff43370)),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff191826),
      ),
      body: FutureBuilder(
          future: fetchArticles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => viewcontent(
                                        content: snapshot.data[index]
                                            ['summary'],
                                        image: snapshot.data[index]['imageUrl'],
                                        title: snapshot.data[index]['title'],
                                      )));
                        },
                        child: Container(
                          height: 125,
                          alignment: Alignment.centerLeft,
                          child: Card(
                            child:
                                Image.network(snapshot.data[index]['imageUrl']),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                snapshot.data[index]["title"],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data[index]["publishedAt"],
                                style: TextStyle(color: Color(0xff868597)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                child: Text(
                                  snapshot.data[index]["summary"],
                                  style: TextStyle(color: Color(0xff868597)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
