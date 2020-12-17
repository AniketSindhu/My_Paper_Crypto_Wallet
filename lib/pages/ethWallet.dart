import 'dart:math';
import "package:convert/convert.dart" show hex;
import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:qr/qr.dart';
import 'package:clipboard/clipboard.dart';
import "package:ethereum_address/ethereum_address.dart";

class EthWallet extends StatefulWidget {
  @override
  _EthWalletState createState() => _EthWalletState();
}

class _EthWalletState extends State<EthWallet> {
  String _address;
  String _privKey;
  String _pubKey;
  void generateBtcWallet() async{
    var rng = new Random.secure();
    _address =  ;
    _privKey = ;
    _pubKey = wallet.pubKey;
    setState(() {});
  }

  void copy(String s) {
    FlutterClipboard.copy(s).then((value) {
      context.showToast(
          msg: 'Copied!',
          position: VxToastPosition.top,
          bgColor: Vx.pink500,
          textColor: Colors.white);
    });
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
          10.heightBox,
          (context.screenPadding.top.heightBox),
          Row(
            children: [
              "BTC Paper Wallet".text.size(25).bold.make().objectTopLeft(),
              InkWell(
                onTap: () {
                  generateBtcWallet();
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.blueAccent,
                  size: 35,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          30.heightBox,
          VxBox(
            child: Column(
              children: [
                VxBox(
                        child: Row(
                  children: [
                    "Address:".text.white.size(20).bold.make(),
                    InkWell(
                        onTap: () {
                          copy(_address);
                        },
                        child: Icon(Icons.copy))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ).p8())
                    .green500
                    .width(double.infinity)
                    .height(40)
                    .make()
                    .objectTopCenter(),
                _address.text.size(15).make().objectCenterLeft().py4().px8(),
                Divider(
                  color: Colors.greenAccent,
                  thickness: 1.5,
                  indent: 0,
                  endIndent: 0,
                ),
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
              .height(240)
              .width(double.infinity)
              .withDecoration(BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 1.5)))
              .makeCentered(),
          20.heightBox,
          VxBox(
            child: Column(
              children: [
                VxBox(
                        child: Row(
                  children: [
                    "Private Key:".text.white.size(20).bold.make(),
                    InkWell(
                        onTap: () {
                          copy(_privKey);
                        },
                        child: Icon(Icons.copy))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ).p8())
                    .red500
                    .width(double.infinity)
                    .height(40)
                    .make()
                    .objectTopCenter(),
                _privKey.text.size(15).make().objectCenterLeft().py4().px8(),
                Divider(
                  color: Colors.redAccent,
                  thickness: 1.5,
                  indent: 0,
                  endIndent: 0,
                ),
                PrettyQr(
                  size: 150,
                  data: _privKey,
                  elementColor: Colors.redAccent,
                  roundEdges: true,
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  typeNumber: 5,
                ).centered().expand(),
              ],
            ),
          )
              .height(280)
              .width(double.infinity)
              .withDecoration(BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 1.5)))
              .makeCentered(),
          20.heightBox,
          VxBox(
            child: VStack([
              VxBox(
                      child: Row(
                children: [
                  "Public Key:".text.white.size(20).bold.make(),
                  InkWell(
                      onTap: () {
                        copy(_pubKey);
                      },
                      child: Icon(Icons.copy))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ).p8())
                  .blue500
                  .width(double.infinity)
                  .height(40)
                  .make()
                  .objectTopCenter(),
              _pubKey.text.size(15).make().objectCenterLeft().py4().px8(),
              Divider(
                color: Colors.blueAccent,
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
              ),
              PrettyQr(
                size: 130,
                data: _pubKey,
                elementColor: Colors.blueAccent,
                roundEdges: true,
                errorCorrectLevel: QrErrorCorrectLevel.M,
                typeNumber: 5,
              ).centered().expand(),
            ]),
          )
              .height(250)
              .width(double.infinity)
              .withDecoration(BoxDecoration(
                  border: Border.all(color: Vx.blue500, width: 1.5)))
              .makeCentered(),
          10.heightBox,
          ExpansionTile(
            childrenPadding: EdgeInsets.all(8),
            tilePadding: EdgeInsets.all(0),
            title: "What to do next?"
                .text
                .size(22)
                .bold
                .white
                .make()
                .objectCenterLeft(),
            children: [
              "To safeguard this wallet you must print or otherwise record the Bitcoin address and private key. It is important to make a backup copy of the private key and store it in a safe location. If you leave the app or press the Refresh icon on the top left then a new private key will be generated and the previously displayed private key will not be retrievable.Your Bitcoin private key should be kept a secret. Whomever you share the private key with has access to spend all the bitcoins associated with that address. If you print your wallet then store it in a zip lock bag to keep it safe from water. Treat a paper wallet like cash.".text.size(16).make()
            ],
          ),
          5.heightBox,
          ExpansionTile(
            childrenPadding: EdgeInsets.all(8),
            tilePadding: EdgeInsets.all(0),
            title: "Is this secure?"
                .text
                .size(22)
                .bold
                .white
                .make()
                .objectCenterLeft(),
            children: [
              "This app never connects you to the internet for wallet generation. It is 100% secure because you never connects to internet in the whole process. This app does not have knowledge of your private key".text.size(16).make()
            ],
          ),
          5.heightBox,
          ExpansionTile(
            childrenPadding: EdgeInsets.all(8),
            tilePadding: EdgeInsets.all(0),
            title: "How do I add funds?"
                .text
                .size(22)
                .bold
                .white
                .make()
                .objectCenterLeft(),
            children: [
              "Add funds to this wallet by instructing others to send bitcoins to your Bitcoin address.".text.size(16).make()
            ],
          ),
          5.heightBox,
          ExpansionTile(
            childrenPadding: EdgeInsets.all(8),
            tilePadding: EdgeInsets.all(0),
            title: "How can I check balance?"
                .text
                .size(22)
                .bold
                .white
                .make()
                .objectCenterLeft(),
            children: [
              "You can check your balance from the homepage by scanning the address qr of this wallet or going to blockchain.info or blockexplorer.com and entering your Bitcoin address.".text.size(16).make()
            ],
          ),
          5.heightBox,
          ExpansionTile(
            childrenPadding: EdgeInsets.all(8),
            tilePadding: EdgeInsets.all(0),
            title: "How can I withdraw funds?"
                .text
                .size(22)
                .bold
                .white
                .make()
                .objectCenterLeft(),
            children: [
              "Scan or copy your private key on all platforms like Blockchain or software like BitcoinCore, make sure the reliability of the website or the software you will use.".text.size(16).make()
            ],
          )
        ],
        axisSize: MainAxisSize.max,
      ).p16().scrollVertical(),
    );
  }
}