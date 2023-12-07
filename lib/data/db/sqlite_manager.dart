import 'package:ecommerce/model/product_model.dart';

abstract class SQliteManager{

  Future<int>  insertItem(String tableName,Map<String,dynamic> toMap);
  Future<int>  deleteAllItem(String tableName);
  Future<int>  deleteProductById(int id);
  Future<List<ProductModel>>getAllCartProduct();






}