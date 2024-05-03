import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padmavati_assignment/Screens/HomeScreen.dart';

import 'PT.dart'; // Import your Product class from PT.dart

class RE extends StatefulWidget {
  const RE({Key? key, required this.sdData, required this.ptData})
      : super(key: key);

  final Map<String, String> sdData;
  final List<Product> ptData;

  @override
  State<RE> createState() => _REState();
}

class _REState extends State<RE> {
  void _sendDataToFirestore() async {
    try {
      // Reference to the Firestore collection
      CollectionReference orders = FirebaseFirestore.instance.collection('orders');

      // Prepare data to be sent to Firestore
      Map<String, dynamic> orderData = {
        'name': widget.sdData['Name'],
        'mobile_number': widget.sdData['Mobile Number'],
        'address': widget.sdData['Address'],
        'pin_code': widget.sdData['Pin Code'],
        'order_status': 'pending', // Assuming order status is initially pending
        'order_details': widget.ptData.map((product) => {
          'product': product.name,
          'quantity': product.quantity,
          // Add more fields as needed
        }).toList(),
      };

      // Send data to Firestore
      await orders.add(orderData);

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data sent to Firestore successfully')),
      );
      Get.to(()=>HomeScreen());
    } catch (e) {
      // Show an error message if data couldn't be sent
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending data to Firestore: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("RE"),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${widget.sdData['Name']}'),
              Text('Mobile Number: ${widget.sdData['Mobile Number']}'),
              Text('Address: ${widget.sdData['Address']}'),
              Text('Pin Code: ${widget.sdData['Pin Code']}'),
              Text('PT Details:'),
              for (var product in widget.ptData)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product: ${product.name}'),
                    Text('Quantity: ${product.quantity}'), // Adjust this according to your data structure
                    // Add more fields as needed
                    SizedBox(height: 10),
                  ],
                ),
            ],
          ),
        ),
        SizedBox(height: 20), // Add some space between the ExpansionTile content and the button
        ElevatedButton(
          onPressed: _sendDataToFirestore,
          style: ElevatedButton.styleFrom(
            primary: Colors.orange, // Set button color to orange
          ),
          child: Text('Send Data to Firestore'),
        ),
      ],
    );
  }
}
