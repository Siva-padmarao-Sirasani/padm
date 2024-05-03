import 'package:flutter/material.dart';

import 'SDP/PT.dart';
import 'SDP/RE.dart';
import 'SDP/SD.dart';
class SDP extends StatefulWidget {
  const SDP({Key? key}) : super(key: key);

  @override
  State<SDP> createState() => _SDPState();
}

class _SDPState extends State<SDP> {
  Map<String, String> _sdData = {};
  List<Product> _ptData = [];

  void _updateSdData(String name, String mobile, String address, String pinCode) {
    setState(() {
      _sdData = {
        'Name': name,
        'Mobile Number': mobile,
        'Address': address,
        'Pin Code': pinCode,
      };
    });
  }

  void _updatePtData(List<Product> products) {
    setState(() {
      _ptData = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PO Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey,
                  ),
                  child: Sd(onDataAdded: _updateSdData),
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey,
                  ),
                  child: PT(onDataAdded: _updatePtData),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey,
                  ),
                  child: RE(sdData: _sdData, ptData: _ptData),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}