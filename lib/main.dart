import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:newsheadlines/page2.dart';

void main() {
  runApp(const Page());
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Future apicall() async {
    http.Response response;

    response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=72abd87555b541328d0cfefa263f33c5'));

    Map user = jsonDecode(response.body);
    List user1 = List.from(user['articles']);
    return user1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            'NEWS HEADLINES',
            style:
                TextStyle(wordSpacing: 10.0, letterSpacing: 10.0, fontSize: 25),
          ),
          centerTitle: false,
          toolbarHeight: 150,
        ),
        body: FutureBuilder(
            future: apicall(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List user2 = snapshot.data;
                return ListView.builder(
                    itemCount: user2.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          Card(
                            color: Colors.deepPurple,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Center(
                                    child: Text(
                                  user2[index]['source']['name'].toString(),
                                  style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                                subtitle: Text(
                                  user2[index]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Page3(user3: user2[index])));
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
