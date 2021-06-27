import 'package:flutter/material.dart';
import 'package:payflownlw/shared/models/boleto_model.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflownlw/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflownlw/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  @override
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Meus extratos",
                    style: TextStyles.titleBoldHeading,
                  ),
                  trailing: Text(
                    "13 ao total",
                    style: TextStyles.captionBody,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    thickness: 1,
                    height: 1,
                  ),
                ),
                BoletoListWidget(
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
