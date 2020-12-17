import 'package:flutter/material.dart';
import 'package:my_paper_wallet/pages/btcWallet.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff171821),
        body: VStack([
          10.heightBox,
          Row(
            children: [
              "My Paper Wallet".text.bold.size(26).fontFamily('Poppins').make(),
              Icon(Icons.help_outline,color: Colors.lightBlue,size: 32,)
            ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          30.heightBox,
          VxBox(
                  child: "Check BTC balance"
                      .text
                      .bold
                      .size(22)
                      .color(Color(0xff171821))
                      .make()
                      .centered())
              .height(90)
              .shadowXl
              .withDecoration(BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Colors.purple[300],
                    Colors.purpleAccent[100]
                  ], begin: Alignment.topLeft, end: Alignment.bottomCenter)))
              .makeCentered(),
          30.heightBox,
          VxBox(
                  child: "Check ETH balance"
                      .text
                      .bold
                      .size(22)
                      .color(Color(0xff171821))
                      .make()
                      .centered())
              .height(90)
              .shadowXl
              .withDecoration(BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Colors.greenAccent[100],
                    Colors.green[400],
                  ], begin: Alignment.bottomRight, end: Alignment.topLeft)))
              .makeCentered(),
          15.heightBox,
          Divider(),
          25.heightBox,
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>BtcWallet()));
            },
            child: VxBox(
              child: HStack([
                VxBox(child: Image.asset('assets/btc.png')).roundedSM.width(50).orange500.make(),
                15.widthBox,
                "Generate BTC paper wallet".text.size(18).bold.make()
              ],alignment: MainAxisAlignment.start,axisSize: MainAxisSize.max,).p12()
            )
                .height(70)
                .shadow
                .rounded
                .color(Color(0xff262A34))
                .makeCentered(),
          ),
          30.heightBox,
          VxBox(
            child: HStack([
              VxBox(child: Image.asset('assets/eth.png').py8()).roundedSM.width(50).color(Colors.blueAccent).make(),
              15.widthBox,
              "Generate ETH paper wallet".text.size(18).bold.make()
            ],alignment: MainAxisAlignment.start,axisSize: MainAxisSize.max,).p12()
          )
              .height(70)
              .shadow
              .rounded
              .color(Color(0xff262A34))
              .makeCentered(),
          25.heightBox,
          Divider(),
          "Learn More".text.size(16).underline.make().objectBottomCenter().expand()
        ]).pSymmetric(v: 32, h: context.screenWidth * 0.055));
  }
}
