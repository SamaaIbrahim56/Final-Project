import 'package:dio/dio.dart';
import 'Product.dart';

class apiservice{

  List  products =[];
  Dio dio =Dio();
  getdata(String category) async{
    Response response = await dio.get("https://dummyjson.com/products/category/$category",queryParameters:{
      "select":"id,title,description,category,price,thumbnail",
    }
    );
Map<String,dynamic> json=response.data;


    for(var i in response.data["products"]){
      products.add(Product.fromJson(i));
      print(i);
    }

    return products ;

  }

}
