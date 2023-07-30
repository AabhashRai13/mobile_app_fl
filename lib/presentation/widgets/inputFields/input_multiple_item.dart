import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/widgets/inputFields/input_widgets.dart';
import 'package:flutter/material.dart';

class MultipleInputFields extends StatefulWidget {
  final String okrFieldText;
  final bool isRequired;
  final List<TextEditingController>? textEditingController;
  final String type;

  final TextStyle textStyle;
  const MultipleInputFields(
      {super.key,
      this.textEditingController,
      required this.isRequired,
      required this.okrFieldText,
      required this.type,
      required this.textStyle});

  @override
  State<MultipleInputFields> createState() => _MultipleInputFieldsState();
}

class _MultipleInputFieldsState extends State<MultipleInputFields> {
  double height = 200;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                widget.okrFieldText,
                style: widget.textStyle,
              )),
          Expanded(
            flex: 2,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.textEditingController!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, getProportionateScreenHeight(8), 0, 0),
                        child: InputFields(
                          inputController: widget.textEditingController![index],
                          isRequired: widget.isRequired,
                          type: widget.type,
                          multipleInputIndex: index,
                        ),
                      );
                    }),
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      iconSize: getProportionateScreenHeight(50),
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.amberAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          if (widget.textEditingController!.length > 2) {
                            widget.textEditingController!.removeLast();
                            height -= 50;
                          }
                        });
                      },
                    ),
                    IconButton(
                      iconSize: getProportionateScreenHeight(50),
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.amberAccent,
                      ),
                      onPressed: () {
                        TextEditingController newTextEditingController =
                            TextEditingController();
                        setState(() {
                          if (widget.textEditingController!.length <= 10) {
                            widget.textEditingController!
                                .add(newTextEditingController);
                            height += 50;
                          }
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}