import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sds_invoice_search/common/network/portal/authenapi.dart';
import 'package:sds_invoice_search/common/network/portal/const.dart';

class LookupApi {
  static const _URL = PortalConstance.DOMAIN + 'search/fkey';

  Future<String> searh(String comTaxCode, String key) async {
    print(_URL);
    var token = await genToken();
    print(token);
    var response = await Dio().get(_URL,
        queryParameters: {"ComTaxCode": comTaxCode, "FKey": key},
        options: Options(
          headers: {
            "Authorization": token, // set content-length
          },
        ));
    var resData = response.toString();
    return json.decode(resData)['str'];
  }

  Future<String> genToken() {
    return AuthenticateApi().authen();
  }
}


