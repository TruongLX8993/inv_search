import 'package:sds_invoice_search/common/network/portal/lookupapi.dart';
import 'package:sds_invoice_search/repository/entity/invoicentity.dart';
import 'package:sds_invoice_search/repository/irepository/invrepo.dart';

class InvRepositoryImpl implements InvRepository {
  @override
  Future<InvEntity> getByFKey(String taxCode, String fKey) async {
    String html = await LookupApi().searh(taxCode, fKey);
    return InvEntity(html);
  }
}
