

import 'package:sds_invoice_search/bloc/invsearchbloc.dart';

void main(List<String> args) {
  var bloc =  InvoiceSearchBloc();
  bloc.stream.listen((html) => print(html));
  bloc.search('0105987432-991','A6A3L7E2063392228837728');
}