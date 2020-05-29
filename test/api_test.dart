import 'dart:developer' as developer;
import 'package:sds_invoice_search/common/network/portal/authenapi.dart';
import 'package:sds_invoice_search/common/network/portal/lookupapi.dart';
import 'package:test/test.dart';

void main() {
  // AuthenticateApi().authen().then((val) {
  //     print(val);
  //   }).catchError((err){
  //     print(err);
  //   } );
  testGetApi();
}

void testGetApi(){
  LookupApi().searh('0105987432-991', 'A6A3L7E2063392228837728').then((val) => print(val));
}