import 'package:flutter/material.dart';

import '../components/custom_surfix_icon.dart';
import '../constants.dart';
import '../size_config.dart';

class inputForm extends StatefulWidget {
  TextEditingController? controller; 
  bool obscureText;
  TextInputType? type; 
  String isNotEmptyMessage; 
  String? labeltext;
  String? hintText;
  RegExp? regExp;
  String? regExpmessage; 
  String urlsvgicon;
  String? name;
  int? maxLines;
  int? minLines;
  bool estreadonly;
  bool validInput;
  Function? onChanged;

  inputForm({
    Key? key,
    this.controller,
    this.obscureText=false,
    this.type,
    this.isNotEmptyMessage = "est obligatoire",
    this.labeltext,
    this.hintText,
    this.regExp,
    this.regExpmessage,
    this.urlsvgicon="assets/icons/Flash Icon.svg",
    this.name,
    this.maxLines=1,
    this.minLines=1,
    this.estreadonly = false,
    this.validInput = true,
    this.onChanged,
  }) : super(key: key);

  @override
  State<inputForm> createState() => _inputFormState();
}

class _inputFormState extends State<inputForm> {
  final List<String?> errors = [];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if(errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      TextFormField(
        obscureText:widget.obscureText, 
        readOnly: widget.estreadonly,
        controller:widget.controller,
        keyboardType: widget.type,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        onSaved: (newValue) => widget.name = newValue,
        onChanged:widget.onChanged as void Function(String value)?,
        validator: widget.validInput? (value) {
          if (value!.isEmpty) {
            return "${widget.labeltext} est ${widget.isNotEmptyMessage}";
          }
          return null;
        }:null,
        decoration: InputDecoration(
          labelText: widget.labeltext,
          hintText: (widget.hintText) != null? widget.hintText:"Entrez ${widget.labeltext}",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:CustomSurffixIcon(svgIcon: widget.urlsvgicon),
        ),
      ),
      SizedBox(height: getProportionateScreenHeight(20)),
      ]);
  }
}