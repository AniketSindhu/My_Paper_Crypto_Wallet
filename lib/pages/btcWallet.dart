import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:qr/qr.dart';

class BtcWallet extends StatefulWidget {
  @override
  _BtcWalletState createState() => _BtcWalletState();
}

class _BtcWalletState extends State<BtcWallet> {
  String _address;
  String _privKey;
  String _pubKey;
  void generateBtcWallet() {
    Wallet wallet = Wallet.random();
    _address = wallet.address;
    _privKey = wallet.privKey;
    _pubKey = wallet.pubKey;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    generateBtcWallet();
  }

  @override
  Widget build(BuildContext context) {
    print(_privKey);
    return Scaffold(
      backgroundColor: Color(0xff171821),
      body: VStack(
        [
          VxBox(
            child: Column(
              children: [
                VxBox(child: Row(
                  children: [
                    "Address:".text.white.size(20).bold.make(),
                    Icon(Icons.copy)
                  ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ).p8())
                    .green500
                    .width(double.infinity)
                    .height(40)
                    .make()
                    .objectTopCenter(),
                _address.text.size(15).make().objectCenterLeft().py4().px8(),
                Divider(color: Colors.greenAccent,thickness: 1.5,indent: 0,endIndent: 0,),
                PrettyQr(
                  size: 130,
                  data: _address,
                  elementColor: Colors.greenAccent,
                  roundEdges: true,
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  typeNumber: 4,
                  image: AssetImage('assets/btc.png'),
                ).centered().expand(),
              ],
            ),
          )
              .height(230)
              .width(double.infinity)
              .withDecoration(BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 1.5)))
              .makeCentered(),
          30.heightBox,
          PrettyQr(
            size: 150,
            data: _privKey,
            elementColor: Colors.redAccent,
            roundEdges: true,
            errorCorrectLevel: QrErrorCorrectLevel.M,
            typeNumber: 5,
          ).centered(),
        ],
        alignment: MainAxisAlignment.center,
        axisSize: MainAxisSize.max,
      ).p16(),
    );
  }
}
