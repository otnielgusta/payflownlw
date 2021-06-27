import 'package:flutter/material.dart';
import 'package:payflownlw/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflownlw/shared/themes/app_text_styles.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';
import 'package:payflownlw/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflownlw/shared/widgets/label_button/label_button.dart';
import 'package:payflownlw/shared/widgets/text_field_insert_dados_widget/text_field_insert_dados_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InserTBoletoPage extends StatefulWidget {
  final String? barcode;
  const InserTBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InserTBoletoPageState createState() => _InserTBoletoPageState();
}

class _InserTBoletoPageState extends State<InserTBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.input,
        ),
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Preencha os dados\ndo boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 39,
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFieldInsertDadosWidget(
                        validator: controller.validateName,
                        icon: Icons.description_outlined,
                        label: "Nome do boleto",
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldInsertDadosWidget(
                        validator: controller.validateVencimento,
                        controller: dueDateInputTextController,
                        icon: FontAwesomeIcons.timesCircle,
                        label: "Vencimento",
                        onChanged: (value) {
                          controller.onChange(dueDate: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldInsertDadosWidget(
                        validator: (_) => controller.validateValor(
                            moneyInputTextController.numberValue),
                        controller: moneyInputTextController,
                        icon: FontAwesomeIcons.wallet,
                        label: "Valor",
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldInsertDadosWidget(
                        validator: controller.validateCodigo,
                        controller: barcodeInputController,
                        icon: FontAwesomeIcons.barcode,
                        label: "Código",
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 73,
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          width: 1,
          color: AppColors.stroke,
        ))),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.maxFinite,
                child: LabelButton(
                  label: "Cancelar",
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName("/home"));
                  },
                  enablePrimary: false,
                ),
              ),
            ),
            DividerVerticalWidget(),
            Expanded(
              child: Container(
                height: double.maxFinite,
                child: LabelButton(
                  label: "Cadastrar",
                  onPressed: () async {
                    await controller.cadastrarBoleto(context);
                  },
                  enablePrimary: true,
                  style: TextStyles.buttonPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
