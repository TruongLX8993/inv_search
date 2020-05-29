

import 'package:sds_invoice_search/repository/entity/invoicentity.dart';

abstract class InvRepository {

  Future<InvEntity> getByFKey(String taxCode,String fKey)  ;
}