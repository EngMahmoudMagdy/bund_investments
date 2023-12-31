import 'dart:convert';
import 'dart:math';

import 'package:bund_investments/core/error/exceptions.dart';
import 'package:bund_investments/features/investments/data/models/bonds_response.dart';
import 'package:http/http.dart';

abstract class InvestmentRemoteDataSource {
  Future<BondResult> getBonds();
}

class InvestmentRemoteDataSourceImpl extends InvestmentRemoteDataSource {
  final Client client;

  //Provide the Http Client for implementation to be used in API calls
  InvestmentRemoteDataSourceImpl({required this.client});

  @override
  Future<BondResult> getBonds() async {
    //MockAPI.io tool is used to mock data of bonds from backend server

    final response = await client
        .get(Uri.https('6324c8554cd1a2834c354126.mockapi.io', '/bonds'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<Bond> list = jsonResponse
          .map<Bond>((itemJson) =>
              Bond.fromJson(itemJson)..apy = (Random().nextDouble() * 10.0))
          .toList();
      return BondResult(list);
    } else if (response.statusCode == 401) {
      //If API wasn't authorized, Then AuthException will be triggered
      throw AuthException();
    } else {
      //If API has any other errors, Then ServerException will be triggered
      throw ServerException(message: 'Failed to connect to Server');
    }
  }
}

class BondResult {
  final List<Bond> list;

  BondResult(this.list);
}
