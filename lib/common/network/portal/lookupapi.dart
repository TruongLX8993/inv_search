import 'package:dio/dio.dart';

const DOMAIN = 'http://tra';
const USER_NAME = '';
const PASS = '';

class LookupApi {
  static const _URL = DOMAIN + '/api/search/fkey';
  String searh(String comTaxCode, String key) async {
    var token = genToken();
    var result = await Dio().get<String>(_URL,
        queryParameters: {"ComTaxCode": comTaxCode, "FKey": key},
        options: Options(
          headers: {
            "Authorization": genToken(), // set content-length
          },
        ));
    return result.data;
  }

  String genToken() {
    
  }
}
