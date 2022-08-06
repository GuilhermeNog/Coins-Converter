import 'package:flutter/material.dart';

class WTextField extends StatelessWidget {
  const WTextField(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.onChanged,
      this.coinText,
      required this.image,
      required this.typeCoin,
      required this.dollarSign})
      : super(key: key);

  final TextEditingController controller;
  final Function() onTap;
  final Function(String) onChanged;
  final dynamic coinText;
  final String image;
  final String typeCoin;
  final String dollarSign;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      keyboardType: TextInputType.number,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 2, left: 8, top: 8, bottom: 8),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 50,
            ),
            child: Image.asset(
              image,
            ),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                typeCoin,
              ),
              Visibility(
                visible: controller.text.isEmpty,
                child: Text(
                  '${coinText == null ? '' : coinText}${dollarSign}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                replacement: Text(
                  '${controller.text}${dollarSign}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
