import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:sds_invoice_search/ui/model/InvModel.dart';

class LookUpDetailScreen extends StatelessWidget {
  InvModel _model;
  LookUpDetailScreen(model) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: AppBar(
  //       title: Text('flutter_html Example'),
  //       centerTitle: true,
  //     ),
  //     body: SingleChildScrollView(child: new HtmlView(
  //           data: _model.html,
  //           stylingOptions: null,
  //         )),
  //   );
  // }
}
