import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../models/category_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
     required this.Product_Model,
  });

  final ProductModel Product_Model;

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: [
          Card(
            elevation: 1,
            color: const Color(0XFFADD9F3FF),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(Product_Model.image!),
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                   Text(
                    '${Product_Model.title}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis, ),
                  ),
                   Text(
                    '${Product_Model.rating?.rate}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blueGrey,overflow: TextOverflow.ellipsis, ),
                  ),
                   Text(
                    '\$${Product_Model.price}',
                    style: const TextStyle(fontSize: 16, color: Colors.orange,overflow: TextOverflow.ellipsis, ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 13,
            right: 13,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)
              ),
              width: 45,
              height: 45,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.add,color: Colors.white,),

              ),

            ),
          )
        ]
    );
  }
}

