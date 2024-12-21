import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_details_screen.dart';
import 'package:store_app/screens/products_screen.dart';
import 'package:store_app/services/get_all_product_service.dart';
import '../widgets/banners_widgets.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/product_card.dart';
import '../widgets/user_info_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final categories = [
    CategoryModel(
        color: Colors.purpleAccent.shade100,
        name: 'Clothing',
        nameUrl: 'men\'s clothing',
        image: 'assets/clothingIcon.png'),
    CategoryModel(
        color: Colors.pinkAccent.shade100,
        name: 'Electronics',
        nameUrl: 'electronics',
        image: 'assets/electronicIcon.png'),
    CategoryModel(
        color: Colors.greenAccent.shade100,
        name: 'Jewelery',
        nameUrl: 'jewelery',
        image: 'assets/jeweleryIcon.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const UserInfoBar(),
              const BannersWidgets(),
              const Row(
                children: [
                  Text(
                    'Shop by category',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                ],
              ),
              Expanded(
                flex: 1,
                child: CategoriesListView(categories: categories),
              ),
              Row(
                children: [
                  const Text(
                    'Special offers',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductsScreen()));
                    },
                    child: const Row(
                      children: [
                        Text(
                          'View All ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 2,
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
                          itemCount: 6,
                          padding: const EdgeInsets.all(8.0),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                                title: products[index].title!,
                                                price: products[index].price!,
                                                description: products[index]
                                                    .description!,
                                                category:
                                                    products[index].category!,
                                                imageUrl:
                                                    products[index].image!,
                                                rate: products[index]
                                                    .rating!
                                                    .rate,
                                                count: products[index]
                                                    .rating!
                                                    .count,
                                                id: products[index].id),
                                      ));
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
