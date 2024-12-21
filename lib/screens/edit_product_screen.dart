import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_text_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key,required this.title, required this.pricee, required this.description, required this.imageUrl, required this.id});

  final String title;
  final double pricee;
  final String description;
  final String imageUrl;
  final int id;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  String? productName, desc, img, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product', style: TextStyle(fontSize: 18)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    textInputType: TextInputType.name,
                    hintText: 'Product Name',
                    prefixIcon: Icons.abc_outlined),
                CustomTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    textInputType: TextInputType.name,
                    hintText: 'Description',
                    prefixIcon: Icons.description),
                CustomTextField(
                    onChanged: (data) {
                      price = data;
                    },
                    textInputType: TextInputType.number,
                    hintText: 'Price',
                    prefixIcon: Icons.price_change_sharp),
                CustomTextField(
                  onChanged: (data) {
                    img = data;
                  },
                  textInputType: TextInputType.name,
                  hintText: 'Image',
                  prefixIcon: Icons.image,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextButton(
                    text: 'Update',
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      try{
                        await updateProduct(
                            widget.title,
                            widget.pricee,
                            widget.description,
                            widget.imageUrl,
                            widget.id,
                        );
                        print('success');
                      }catch(e)
                      {
                        print(e);
                      }
                      isLoading = false;
                      setState(() {});
                    }),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<void> updateProduct(String title,pricee,description,imageUrl,int id) async{
    await UpdateProductService().updateProduct(
      id: id,
      title: productName ?? title,
      price: price ?? pricee,
      desc: desc ?? description,
      image: img ?? imageUrl,
    );
  }
}
