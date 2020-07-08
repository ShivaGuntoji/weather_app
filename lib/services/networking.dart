import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper
{
  String url;
  NetworkHelper(this.url);

  Future getNetwordData() async
  {
  http.Response resp=await http.get(url);
  if(resp.statusCode== 200)
  {
    print('hi');
  return (jsonDecode((resp.body)));
  }
  else
  return Exception;
}
}