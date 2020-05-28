

import 'package:sds_invoice_search/common/repository/entity/invoicentity.dart';

abstract class InvRepository{

  InvEntity getByFKey(String fKey);
}