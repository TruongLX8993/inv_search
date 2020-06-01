

import 'dart:async';
import 'dart:html';

import 'package:sds_invoice_search/bloc/domain/downloadpdfresult.dart';
import 'package:sds_invoice_search/common/network/portal/lookupapi.dart';

class DownloadInvPDFBloc{

  StreamController<DownloadInvPDFResult> _streamController = StreamController<DownloadInvPDFResult>();
  Stream get stream => _streamController.stream;

  // void downloadPDF(String taxCode,String lookupCode){

  //         var dir = await getApplicationDocumentsDirectory();
          
  //   LookupApi().getPDFFile(taxCode,lookupCode).then((value) {
      

  //     print("Download files");
  //     print("${dir.path}/$filename");
  //     File file = File("${dir.path}/$filename");

  //     var result = DownloadInvPDFResult();
  //     result.status = 1;
  //     result.content = value;
  //     _streamController.sink.add(result);
  //   });
  // }

}