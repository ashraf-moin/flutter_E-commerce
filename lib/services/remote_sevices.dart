import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/api_endPoint.dart';

class RemoteServices{

static final Dio _dio = Dio(
  BaseOptions(
  baseUrl: ApiEndPoint.BASE_URL,
  connectTimeout: const Duration(seconds: 60),
  receiveTimeout: const Duration(seconds: 60),
  )

 );
/// Fetches all product data from the 'ApiEndPoint.ALL_PRODUCT_LIST' endpoint and returns it as a list of 'ProductModel' objects.
  static Future<List<ProductModel>> getAllProductList() async{
    try{
      Response response = await _dio.get(ApiEndPoint.ALL_PRODUCT_LIST);
      var result = json.encode(response.data);
      return productModelFromJson(result);
    }catch (error){
      rethrow;
    }
  }
static Future<List<ProductModel>> getAllCategoriesList() async{
  try{
    Response response = await _dio.get(ApiEndPoint.ALL_PRODUCT_CATEGORIES);
    var result = json.encode(response.data);
    return productModelFromJson(result);
  }catch (error){
    rethrow;
  }
}
static Future<List<ProductModel>> getAllCategoriesJeweleryList() async{
  try{
    Response response = await _dio.get(ApiEndPoint.ALL_PRODUCT_JEWELERY);
    var result = json.encode(response.data);
    return productModelFromJson(result);
  }catch (error){
    rethrow;
  }
}
static Future<List<ProductModel>> getAllCategoriesElectronicsList() async {
  try {
    Response response = await _dio.get(ApiEndPoint.ALL_PRODUCT_ELECTRONICS);
    var result = json.encode(response.data);
    return productModelFromJson(result);
  } catch (error) {
    rethrow;
  }
}

static Future<List<ProductModel>> getAllCategoriesWomenClothList() async {
  try {
    Response response = await _dio.get(ApiEndPoint.ALL_PRODUCT_WOMENCOlOTH);
    var result = json.encode(response.data);
    return productModelFromJson(result);
  } catch (error) {
    rethrow;
  }
}
static Future<List<ProductModel>> getAllCategoriesMenClothList() async {
  try {
    Response response = await _dio.get(ApiEndPoint.ALL_PRODUCT_MENCOlOTH);
    var result = json.encode(response.data);
    return productModelFromJson(result);
  } catch (error) {
    rethrow;
  }
}
  static Future<List<ProductModel>> getAllList(String endPoint) async{
    try{
      Response response = await _dio.get(endPoint);
      var result = json.encode(response.data);
      return productModelFromJson(result);
    }catch (error){
      rethrow;
    }
  }




}