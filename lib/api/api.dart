import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getBalance(String address) async{
  final response = await http.get('https://api.smartbit.com.au/v1/blockchain/address/$address');
    if(response.statusCode==200){
      Map<String,dynamic> res = Map();
      final jsonRes = json.decode(response.body);
      res["result"] = true;
      res["balance"] = jsonRes["address"]["total"]["spent"];
      res["received"] = jsonRes["address"]["total"]["received"];
      res["spent"] = jsonRes["address"]["total"]["spent"];
      res["transaction_count"] = jsonRes["address"]["total"]["transaction_count"];
      return res;
    }
    else{
      return {
        "result" : false
      };
    }
}