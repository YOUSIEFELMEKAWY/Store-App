import 'package:flutter/material.dart';
import 'package:store_app/screens/products_by_category_screen.dart';
import '../models/category_model.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsByCategoryScreen(
                      categoryName: categories[index].nameUrl),
                ));
          },
          child: Row(
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: categories[index].color,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(categories[index].image),
                      height: 65,
                    ),
                    Text(categories[index].name)
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
