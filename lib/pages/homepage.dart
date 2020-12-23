import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_tooltip/flutter_tooltip.dart';
import 'package:my_paper_wallet/api/api.dart';
import 'package:my_paper_wallet/pages/balance.dart';
import 'package:my_paper_wallet/pages/btcWallet.dart';
import 'package:my_paper_wallet/pages/choose.dart';
import 'package:my_paper_wallet/pages/ethWallet.dart';
import 'package:my_paper_wallet/pages/moreInfo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static GlobalKey key1 = GlobalKey();
  List<TooltipModel> tip = [TooltipModel(key: key1, child: "This Bitcoin address generator guides you to easily print your secure bitcoin paper wallet. Once the funds are transferred to your paper wallet, your bitcoin and your private information are stored offline and protect against hackers and other threats.\nYou just have to keep your wallet safe as you would for money.".text.size(18).make())];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff171821),
        body: VStack([
          10.heightBox,
          Row(
            children: [
              "My Paper Wallet".text.bold.size(26).fontFamily('Poppins').make(),
              InkWell(
                onTap: (){
                  FlutterTooltip.showTips(tip, context);
                },
                child: Icon(Icons.help_outline,color: Colors.lightBlue,size: 32,key: key1,))
            ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          50.heightBox,
          InkWell(
              onTap: () async{
/*                 String qr = await FlutterBarcodeScanner.scanBarcode(
                  '#ff171821', 
                  'Cancel', 
                  true,  
                  ScanMode.QR);
                if(qr!=null){
                  final res = await getBalance(qr);
                  if(res["result"]){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Balance(address: qr,wallet: res,)));
                  }
                  else{
                    context.showToast(
                        msg: 'Wrong address',
                        position: VxToastPosition.top,
                        bgColor: Vx.red500,
                        showTime: 4000,
                        textColor: Colors.white);
                  }
                } */
                Navigator.push(context,MaterialPageRoute(builder:(context)=>Choose()));
              },
              child: VxBox(
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
          ),
/*           VxBox(
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
              .makeCentered(), */
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
                "Generate BTC paper wallet".text.size(19).bold.make()
              ],alignment: MainAxisAlignment.start,axisSize: MainAxisSize.max,).p12()
            )
                .height(90)
                .shadow
                .rounded
                .color(Color(0xff262A34))
                .makeCentered(),
          ),
          30.heightBox,
/*           InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>EthWallet()));
            },
            child: VxBox(
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
          ),
          25.heightBox, */
          Divider(),
          InkWell(
            child: "Learn More".text.size(16).underline.make(),
            onTap: (){
              /* Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreInfo())); */
              launch('https://www.investopedia.com/terms/p/paper-wallet.asp');
            },
          ).objectBottomCenter().expand()
        ]).pSymmetric(v: 32, h: context.screenWidth * 0.055));
  }
}
