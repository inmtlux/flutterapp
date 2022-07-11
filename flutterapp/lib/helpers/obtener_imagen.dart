import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

obtenerImage(String collection ,String id) async{
    var url = Uri.http('api-sliderin.herokuapp.com', '/api/upload/'+collection+'/'+id);
    final resp = await http.get(url);
    final json = convert.jsonDecode(resp.body) as Map<String, dynamic>;
    print('====================');
    print('imagen:' + json['img']);
    print('====================');
    return json['img'];
  }