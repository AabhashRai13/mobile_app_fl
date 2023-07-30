import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final bool isRequired;

  final TextEditingController inputController;
  final String? validationMsg;
  final String? hintText;
  final String? labelText;
  final String? icon;
  final String? prefixIcon;
  final String? type;
  final int? multipleInputIndex;
  final TextInputType? inputType;
  const InputFields(
      {super.key,
      required this.inputController,
      required this.isRequired,
      this.validationMsg,
      this.hintText,
      this.labelText,
      this.icon,
      this.prefixIcon,
      this.type,
      this.multipleInputIndex,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.multiline,
      maxLines: null,
      controller: inputController,
      onChanged: (value) {},
      validator: (value) {
        if (isRequired && value!.isEmpty) {
          return validationMsg ?? AppStrings.cannotBeEmpty;
        }
        return null;
      },
      decoration: InputDecoration(
        hoverColor: ColorManager.blueBackground,
        hintText: hintText,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.only(left: 30, top: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[50]!),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[50]!),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget labelTexts(String? label) {
    if (isRequired && label != null) {
      return SizedBox(
        width: getProportionateScreenWidth(170),
        child: Row(
          children: [
            Text(label),
            const Text(
              " *",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      );
    } else if (label != null) {
      return Text(label);
    } else {
      return const Text(AppStrings.emptyString);
    }
  }
}