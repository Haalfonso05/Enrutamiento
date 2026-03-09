import 'package:dio/dio.dart';
import 'package:enrutamiento/const/dragonball_const.dart';
import 'package:enrutamiento/model/dragonball_model.dart';

class DragonballService {
  final _dio = Dio();

  Future<List<DragonballModel>> getCharacters() async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      final data = response.data['items'] as List;
      return data.map((e) => DragonballModel.fromJson(e as Map<String, dynamic>)).toList();
    }
    return [];
  }
}
