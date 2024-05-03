import 'package:flutter/material.dart';
import '../../constants/AppColors.dart';
import '../../constants/AppStyles.dart';

class PT extends StatefulWidget {
  const PT({Key? key, required this.onDataAdded}) : super(key: key);

  final Function(List<Product>) onDataAdded;

  @override
  State<PT> createState() => _PTState();
}

class _PTState extends State<PT> {
  List<Product> products = [
    Product(name: "Product 1"),
    Product(name: "Product 2"),
    Product(name: "Product 3"),
  ];

  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('PT'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Table(
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Text('Product', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    TableCell(
                      child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    TableCell(
                      child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  for (var product in products)
                    TableRow(children: [
                      TableCell(
                        child: Text(product.name, style: TextStyle(fontSize: 16.0)),
                      ),
                      TableCell(
                        child: TextFormField(
                          controller: quantityController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                      ),
                      TableCell(
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                      ),
                    ]),
                ],
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Product newProduct = Product(
                    name: products.last.name,
                    quantity: int.tryParse(quantityController.text) ?? 0,
                    price: double.tryParse(priceController.text) ?? 0.0,
                  );
                  products.add(newProduct);
                  widget.onDataAdded(products);
                  quantityController.clear();
                  priceController.clear();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.orangeColor),
                ),
                child: Text(
                  "Add",
                  style: AppStyles.mediumBoldText(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  int quantity;
  double price;

  Product({required this.name, this.quantity = 0, this.price = 0.0});
}
