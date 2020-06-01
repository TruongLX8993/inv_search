import 'package:flutter/material.dart';

import '../../bloc/invsearchbloc.dart';
import '../model/InvModel.dart';
import 'lookupresultscreen.dart';

class LockupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LookUpScreenState();
}

class _LookUpScreenState extends State<LockupScreen> {
  static const String INVOICE_TAB_TITLE = 'Search Invoice';
  static const String INVENTORY_TAB_TITLE = 'Search Inventory';

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _BodyWidgest(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('$INVOICE_TAB_TITLE'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('$INVENTORY_TAB_TITLE'),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class _BodyWidgest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyWidgestState();
}

class _BodyWidgestState extends State<_BodyWidgest> {
  static const _dbTaxCode = '0105987432-991';
  static const _dbLookUPCode = 'A6A3L7E2063392228837728';

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  InvoiceSearchBloc bloc = InvoiceSearchBloc();
  TextEditingController taxCodeFieldController = new TextEditingController();
  TextEditingController lookupCodeFieldController = new TextEditingController();

  TextField fkeyField;

  void onPressed() {
    String taxCode = taxCodeFieldController.text;
    String lookupCode = lookupCodeFieldController.text;
    bloc.search(taxCode, lookupCode);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.stream.listen((event) {
      if (event.status == 1) {
        var model = new InvModel();
        model.html = event.html;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LookUpDetailScreen(model)),
        );
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taxCodeField = TextField(
      obscureText: false,
      style: style,
      controller: taxCodeFieldController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "tax code",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    fkeyField = TextField(
      obscureText: false,
      style: style,
      controller: lookupCodeFieldController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Lookup code",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final searchBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onPressed,
        child: Text("Search",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    lookupCodeFieldController.text =  _dbLookUPCode;
    taxCodeFieldController.text = _dbTaxCode;
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/image/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 25.0),
                taxCodeField,
                SizedBox(height: 25.0),
                fkeyField,
                SizedBox(
                  height: 35.0,
                ),
                searchBtn,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
