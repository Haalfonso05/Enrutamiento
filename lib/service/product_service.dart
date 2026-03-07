import 'package:dio/dio.dart';
import 'package:enrutamiento/const/product_const.dart';
import 'package:enrutamiento/model/product_model.dart';

class ProductService{

  final _dio = Dio();

  Future<List<ProductModel>> getProduct() async{
    final response = await _dio.get(productConst);
    if(response.statusCode == 200){
      final data = response.data;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    }
    return [];

  }
}