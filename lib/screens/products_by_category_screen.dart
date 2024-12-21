import 'package:flutter/material.dart';
import 'package:store_app/screens/product_details_screen.dart';
import 'package:store_app/services/get_products_by_category.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../widgets/user_info_bar.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  const ProductsByCategoryScreen({super.key, required this.categoryName});

  final String categoryName;
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
                  future: GetProductsByCategory().getProductsByCategory(categoryName: categoryName),
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
