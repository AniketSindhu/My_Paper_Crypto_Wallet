import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MoreInfo extends StatefulWidget {
  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171821),
      body: VStack([
        context.screenPadding.top.heightBox,
        5.heightBox,
        "FAQ".text.size(40).extraBold.make(),
        10.heightBox,
        ExpansionTile(
          childrenPadding: EdgeInsets.all(8),
          tilePadding: EdgeInsets.all(0),
          title: "What is paper wallet?"
              .text
              .size(22)
              .bold
              .white
              .make()
              .objectCenterLeft(),
          children: [
            "Generate a paper wallet and print it out. Once the funds are transferred to your paper wallet, your bitcoin and your private information are stored offline and protect against hackers and other threatsYou just have to keep your wallet safe as you would for money.All public information to receive your bitcoin on your wallet. (right side)Once folded, your private information is sealed, the design is secure to avoid revealing your private key by means of a transparent light projection.You can print multiple copies of your portfolioPrint a bitcoin paper wallet is also useful for giving a gift.We advise you to print your bitcoin portfolio on paper of more than 80g / m2, for a better rendering and a better protection, printing on laminated paper and with a laser printer.Once your wallet is printed, folded and sealed, all you have to do is keep it away from its worst enemy ... Water ;)".text.size(16).make()
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
      ]).p12().scrollVertical(),
    );
  }
}