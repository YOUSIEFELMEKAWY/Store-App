import 'package:flutter/material.dart';
import 'package:store_app/screens/product_details_screen.dart';
import '../models/product_model.dart';
import '../services/get_all_product_service.dart';
import '../widgets/product_card.dart';
import '../widgets/user_info_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const UserInfoBar(),
              Expanded(
                child: FutureBuilder<List<ProductModel>>(
                  future: GetAllProductsService().getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel> products = snapshot.data!;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: products.length,
                        padding: const EdgeInsets.all(8.0),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                              id: products[index].id!,
                                                title: products[index].title!,
                                                price: products[index].price!,
                                                description: products[index]
                                                    .description!,
                                                category:
                                                    products[index].category!,
                                                imageUrl:
                                                    products[index].image!,
                                                rate: products[index]
                                                    .rating
                                                    ?.rate,
                                                count: products[index]
                                                    .rating
                                                    ?.count)));
                              },
                              child: ProductCard(
                                Product_Model: products[index],
                              ));
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
