import 'dart:async';
import 'package:sds_invoice_search/bloc/domain/invlookupresult.dart';
import 'package:sds_invoice_search/repository/irepository/invrepo.dart';
import 'package:sds_invoice_search/repository/lookup.dart';
import 'bloc.dart';
import 'dart:developer' as developer;

class InvoiceSearchBloc extends Bloc<InvLookUpResult> {
  StreamController<InvLookUpResult> _streamController =
      StreamController<InvLookUpResult>();
  Stream<InvLookUpResult> get stream => _streamController.stream;
  @override
  void dispose() {
    _streamController.close();
  }

  void search(String taxCode, String fkey) {
    InvRepository repo = LookupRepo.instance.getRepo<InvRepository>();
    repo.getByFKey(taxCode, fkey).then((inv) {
      var result = InvLookUpResult();
      result.status = 1;
      result.html = inv.getHtml();
      print(inv.getHtml());
      _streamController.sink.add(result);
    });
  }
}
