import 'dart:convert';
import 'package:simple_image_app/models/meme_model.dart';
import 'package:http/http.dart' as http;

class MemeRepository {
  Future<List<MemeModel>> getMemes() async {
    final http.Response response = await http.get(
     Uri.parse('https://api.imgflip.com/get_memes'),
    );
    final decodedResp = jsonDecode(response.body);
    // log('cek getMemes resp : $decodedResp');
     return (decodedResp['data']['memes'] as List).map((e) => MemeModel.fromJson(e)).toList();
    }
}