import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:qr/qr.dart';

class Balance extends StatefulWidget {
  final Map<String, dynamic> wallet;
  final String address;

  Balance({this.wallet,this.address});
  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171821),
      body: VStack([
        context.screenPadding.top.heightBox,
        "BTC Wallet Overview".text.bold.size(26).fontFamily('Poppins').make(),
        35.heightBox,
        PrettyQr(
          data: widget.address,
          size: 150,
          elementColor: Colors.greenAccent,
          typeNumber: 4,
          roundEdges: true,
          errorCorrectLevel: QrErrorCorrectLevel.M,
        ).centered().shimmer(
              duration: Duration(seconds: 2),
              primaryColor: Colors.greenAccent[400],
              secondaryColor: Colors.greenAccent[200],
            ),
        20.heightBox,
        Column(
          children: [
            "${widget.wallet["balance"]} BTC".text.extraBold.size(32).makeCentered().shimmer(
                primaryColor: Colors.pink[400],
                secondaryColor: Colors.pink[200],
                duration: Duration(seconds: 2)),
            "Balance"
                .text
                .color(Colors.yellowAccent[700])
                .size(18)
                .makeCentered()
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        20.heightBox,
        Divider(
          thickness: 1.5,
        ),
        4.heightBox,
        HStack(
          [
            "Recieved :".text.bold.size(24).make().px2(),
            "${widget.wallet["received"]} BTC".text.bold.size(20).make().px2()
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        ),
        4.heightBox,
        Divider(
          thickness: 1.5,
        ),
        10.heightBox,
        HStack(
          [
            "Sent :".text.bold.size(24).make().px2(),
            "${widget.wallet["spent"]} BTC".text.bold.size(20).make().px2()
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        ),
        4.heightBox,
        Divider(
          thickness: 1.5,
        ),
        4.heightBox,
        HStack(
          [
            "Txn count :".text.bold.size(24).make().px2(),
            "${widget.wallet["transaction_count"]}".text.bold.size(20).make().px2()
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        ),
        Divider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: (){
            launch('https://www.blockchain.com/btc/address/${widget.address}');
          },
          child: "Get More Info".text.medium.underline.size(18).make()).objectBottomCenter().expand()
      ]).pSymmetric(v: 32, h: context.screenWidth * 0.055),
    );
  }
}
