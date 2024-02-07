import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/models/pub.dart';

class DropdownItems extends StatefulWidget {
  @override
  _DropdownItemState createState() => _DropdownItemState();
}
class _DropdownItemState extends State<DropdownItems> {
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _dropdownFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "civilité",
                  hintText: "Selectionnez votre civilité",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Bell.svg"),
                  filled: true,
                  //fillColor: Colors.blueAccent,
                ),
                //dropdownColor: Colors.blueAccent,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: civiliteItems)
                
          ],
        ));
  }
}