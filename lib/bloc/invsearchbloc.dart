


import 'dart:async';
import 'package:sds_invoice_search/repository/irepository/invrepo.dart';
import 'package:sds_invoice_search/repository/lookup.dart';

import 'bloc.dart';

class InvoiceSearchBloc extends Bloc<String>{
  
  
  StreamController<String> _streamController = StreamController<String>();
  Stream<String> get stream => _streamController.stream;
  @override
  void dispose() {
    _streamController.close();
  }

  void search(String taxCode,String fkey){
    InvRepository repo = LookupRepo.instance.getRepo<InvRepository>();
      repo.getByFKey(taxCode, fkey).then((inv) {
          _streamController.sink.add(inv.getHtml());
      });
  }

}