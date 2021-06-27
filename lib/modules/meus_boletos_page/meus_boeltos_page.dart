import 'package:flutter/material.dart';
import 'package:payflownlw/shared/models/boleto_model.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflownlw/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflownlw/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({
    Key? key,
  }) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ValueListenableBuilder<List<BoletoModel>>(
            valueListenable: controller.boletosNotifier,
            builder: (_, boletos, __) => BoletoInfoWidget(
              size: boletos.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Meus boletos",
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
