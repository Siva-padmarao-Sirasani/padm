import 'package:flutter/material.dart';
import '../../constants/AppColors.dart';
import '../../constants/AppStyles.dart';

class Sd extends StatefulWidget {
  const Sd({Key? key, required this.onDataAdded}) : super(key: key);

  final Function(String, String, String, String) onDataAdded;

  @override
  State<Sd> createState() => _SdState();
}

class _SdState extends State<Sd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('SD'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: mobileController,
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Address',
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: pinCodeController,
                decoration: InputDecoration(
                  hintText: 'Pin Code',
                  labelText: 'Pin Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  widget.onDataAdded(
                    nameController.text,
                    mobileController.text,
                    addressController.text,
                    pinCodeController.text,
                  );
                  nameController.clear();
                  mobileController.clear();
                  addressController.clear();
                  pinCodeController.clear();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.orangeColor,
                  ),
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
