import 'package:flutter/material.dart';
import 'package:store_app/screens/edit_product_screen.dart';
import 'package:store_app/widgets/custom_text_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final double? rate;
  final int? count;
  final int id;

  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rate,
    required this.count, required this.id,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            // Price
            Text(
              "\$$price",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),

            // Category
            Row(
              children: [
                const Icon(Icons.category, color: Colors.blueAccent),
                const SizedBox(width: 8.0),
                Text(
                  category,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Description
            const Text(
              "Description:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),

            // Rating
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 8.0),
                Text(
                  "Rating: ${rate?.toStringAsFixed(1) ?? "N/A"}",
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  "${count ?? 0} reviews",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: CustomTextButton(
                  onPressed:
                      (){
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) =>   EditProductScreen(
                            id: id,
                            title: title,
                            description: description,
                            pricee: price,
                            imageUrl: imageUrl,
                          ),
                        ),

                    );
                    },
                  text: 'Edit',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
