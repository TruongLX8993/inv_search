import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sds_invoice_search/common/network/portal/authenapi.dart';
import 'package:sds_invoice_search/common/network/portal/const.dart';

class LookupApi {
  static const _URL = PortalConstance.DOMAIN + 'search/fkey';
  static const _DOWNLOAD_PDF_URL = PortalConstance.DOMAIN + 'search/downloadPDF';
  Future<String> search(String comTaxCode, String key) async {
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
  
  Future getPDFFile(String comTaxCode, String key) async{

     var token = await genToken();
     var response = await Dio().get(_DOWNLOAD_PDF_URL,
        queryParameters: {"ComTaxCode": comTaxCode, "FKey": key},
        options: Options(
          headers: {
            "Authorization": token, // set content-length
          },
        ));
      return response.data;
  }

  Future<String> genToken() {
    return AuthenticateApi().authen();
  }
}


