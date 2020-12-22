import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:my_paper_wallet/api/api.dart';
import 'package:my_paper_wallet/pages/balance.dart';
import 'package:velocity_x/velocity_x.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  TextEditingController addressController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171821),
      body:!loading?Center(
        child: Column(
          children: [
            "BTC Balance".text.white.extraBold.size(30).make().objectTopCenter(),
            30.heightBox,
            Row(
              children: [
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Enter your BTC address',
                    labelStyle: TextStyle(color: Colors.greenAccent),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellowAccent, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellowAccent, width: 1.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellowAccent, width: 1.0),
                    ),
                  ),
                ).wThreeForth(context),
                10.widthBox,
                InkWell(
                  onTap: () async{
                    addressController.text = await FlutterBarcodeScanner.scanBarcode(
                      '#ff171821', 
                      'Cancel', 
                      true,  
                      ScanMode.QR);
                    setState(() {});
                  },
                  child: VxBox(
                    child: Icon(Icons.qr_code,color: Colors.greenAccent,size: 40,)
                  ).withDecoration(BoxDecoration(border: Border.all(color:Colors.yellowAccent))).make(),
                ).h(60).expand(),
              ],
            ),
            20.heightBox,
            RaisedButton(
              child:'Check Balance'.text.white.bold.size(20).make(),
              color: Colors.pinkAccent,
              onPressed: () async{
                  setState(() {
                    loading =true;
                  });
                  final res = await getBalance(addressController.text);
                  if(res["result"]){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Balance(address: addressController.text,wallet: res,)));
                  }
                  else{
                    context.showToast(
                        msg: 'Wrong address',
                        position: VxToastPosition.top,
                        bgColor: Vx.red500,
                        showTime: 4000,
                        textColor: Colors.white);
                  }
                  setState(() {
                    loading =false;
                  });
              }
            )
          ],mainAxisAlignment: MainAxisAlignment.center,
        ),
      ).p12():Center(
        child:VxBox(child: "Loading..".text.size(20).bold.make().centered().p8()).roundedLg.height(120).width(120).shadowXl.green800.make()
      )
    );
  }
}