import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kfc_mini/API_AllBeer.dart';
import 'package:kfc_mini/Call_API.dart';
import 'package:kfc_mini/Detail_beer.dart';
// import 'package:http/http.dart';

class beermain extends StatefulWidget {
  const beermain({Key? key}) : super(key: key);

  @override
  _beermainState createState() => _beermainState();
}

class _beermainState extends State<beermain> {
  late OrderApiProvider callAPI;

  @override
  void initState() {
    super.initState();
    callAPI = OrderApiProvider();
  }

  Widget _buildListView(
      List<AllBeer> allbeer, double screenHeight, double screenWidth) {
    return ListView.builder(
        itemCount: allbeer.length,
        itemBuilder: (context, index) {
          // Load Model
          AllBeer allbeers = allbeer[index];

          // print(historyweek);

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailBeer(beer: allbeers)),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.grey,
                        child: Image.network(
                          '${allbeers.imageUrl}',
                          width: screenWidth * 0.2,
                          height: screenHeight * .2,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${allbeers.name}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${allbeers.description}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: callAPI.getBeer(),
          builder:
              (BuildContext context, AsyncSnapshot<List<AllBeer>> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(
                child:
                    Text('Something wrong with ${snapshot.error.toString()}'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              // List<Product> products = snapshot.data;
              // print("sss");
              return Scaffold(
                  body: _buildListView(
                      snapshot.data!, screenHeight, screenWidth));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
