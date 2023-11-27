import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key, required this.user3});
  final user3;
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.user3['source']['name'].toString(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, letterSpacing: 5.0, fontSize: 30),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 150,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    widget.user3['title'].toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.height,
                child: Image.network(
                  widget.user3['urlToImage'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.user3['url'].toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'DESCRIPTION :',
                      style: TextStyle(
                          fontSize: 25,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      widget.user3['description'].toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'PUBLISHED AT : ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white,
                          decorationThickness: 3.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      widget.user3['publishedAt'].toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'AUTHOR  : ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white,
                          decorationThickness: 3.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Center(
                      child: Text(
                        widget.user3['author'].toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
