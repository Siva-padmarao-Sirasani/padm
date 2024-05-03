import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padmavati_assignment/Screens/SDP.dart';
import 'package:padmavati_assignment/constants/AppColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = 'Select'; // Initially selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Center(
          child: Text(
            "Product List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Sign Out'),
                value: 'signOut',
              ),
            ],
            onSelected: (value) {
              if (value == 'signOut') {
                // Implement the sign-out logic
                signOut();
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orangeColor,
        onPressed: () {
          Get.to(() => const SDP());
        },
        child: const Icon(
          Icons.add,
          size: 25.0,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedValue,
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue!;
              });
            },
            items: <String>['Select', 'Ordered', 'Packaged', 'Delivered']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _selectedValue == 'Select'
                  ? FirebaseFirestore.instance.collection('orders').snapshots()
                  : FirebaseFirestore.instance.collection('orders').where('order_status', isEqualTo: _selectedValue).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var document = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            title: Text(
                              document['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              document['mobile_number'],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            trailing: Text(
                              document['order_status'],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ),

        ],
      ),

    );
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login screen using named route
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
