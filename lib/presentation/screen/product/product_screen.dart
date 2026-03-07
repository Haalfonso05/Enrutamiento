import 'package:enrutamiento/model/product_model.dart';
import 'package:enrutamiento/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> products = [];
  bool isLoading = true;
  String error = '';
  
  @override
  void initState(){
    super.initState();
    getProduct();
  }
  
  void getProduct() async{
    try {
      setState(() {
        isLoading = true;
        error = '';
      });
      final List<ProductModel> temporal = await ProductService().getProduct();
      setState(() {
        products = temporal;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            ElevatedButton(
              onPressed: getProduct,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }
    
    if (products.isEmpty) {
      return const Center(child: Text('No hay productos'));
    }
    
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.title),
          subtitle: Text(product.description),
        );
      },
    );
  }
}