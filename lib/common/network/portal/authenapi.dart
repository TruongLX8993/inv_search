import 'package:dio/dio.dart';
import 'package:sds_invoice_search/common/network/portal/const.dart';

class AuthenticateApi {
  final String _getTokenUrl = PortalConstance.DOMAIN + 'authen/gettoken';
  final String _username = PortalConstance.USER_NAME;
  final String _password = PortalConstance.PASS;
  static String _cacheToken = '';

  Future<String> authen() async {
    Response response = await Dio().get(
      _getTokenUrl,queryParameters:{"user":_username,"password":_password});
    _cacheToken = response.data.toString();
    print("here");
    return _cacheToken;
  }
}
