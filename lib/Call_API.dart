import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kfc_mini/API_AllBeer.dart';


class OrderApiProvider {
  final Dio _dio = Dio();

  Future<List<AllBeer>> getBeer() async {
    Response response = await _dio.get(
        "https://api.punkapi.com/v2/beers");
    if (response.statusCode == 200) {
      print(response.statusCode);
      return allBeerFromJson(response.data);
    } else {
      print(response.statusCode);
      // int err = response.statusCode;
      return allBeerFromJson(response.data);
    }
    // Response response = await _dio.get("https://ta-kemall.com/api/riderconnect/history_detail?Or_Driver_ID=$riderid");
    // return productFromJson((response.data));
  }

}
