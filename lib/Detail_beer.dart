import 'package:flutter/material.dart';
import 'package:kfc_mini/API_AllBeer.dart';

class DetailBeer extends StatefulWidget {
  final AllBeer beer;
  const DetailBeer({Key? key, required this.beer}) : super(key: key);

  @override
  _DetailBeerState createState() => _DetailBeerState();
}

class _DetailBeerState extends State<DetailBeer> {
  late AllBeer beers;
  @override
  void initState() {
    super.initState();
    beers = widget.beer;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('${beers.name}')),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                color: Colors.grey,
                child: Image.network(
                  '${beers.imageUrl}',
                  width: screenWidth * 0.9,
                  // height: screenHeight * .2,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                width: screenWidth * 0.9,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Card(
                      // color: Colors.white10,
                      // shape: ShapeBorder(),
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${beers.name}',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '${beers.description}',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
