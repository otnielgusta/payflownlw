import 'package:flutter/material.dart';
import 'package:payflownlw/modules/extract/extract_page.dart';
import 'package:payflownlw/modules/home_page/home_controller.dart';
import 'package:payflownlw/modules/home_page/widgets/app_bar_widget.dart';
import 'package:payflownlw/modules/meus_boletos_page/meus_boeltos_page.dart';
import 'package:payflownlw/shared/models/user_model.dart';
import 'package:payflownlw/shared/themes/appcolors.dart';
import 'package:payflownlw/shared/widgets/boleto_list/boleto_list_controller.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BoletoListController boletoController;

  final String photoDefault =
      "https://image.flaticon.com/icons/png/512/44/44948.png";
  @override
  void initState() {
    boletoController = BoletoListController();
    super.initState();
  }

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          image:
              widget.user.photoUrl != "" && widget.user.photoUrl != "photoUrl"
                  ? widget.user.photoUrl
                  : photoDefault,
          nome: widget.user.name,
        ),
        preferredSize: Size.fromHeight(152),
      ),
      body: [
        MeusBoletosPage(
          key: UniqueKey(),
        ),
        ExtractPage(
          key: UniqueKey(),
        ),
      ][controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  controller.setPage(0);
                });
              },
              icon: Icon(
                controller.currentPage == 0 ? Icons.home : Icons.home_outlined,
                color: controller.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, "/barcode_scanner");
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  controller.setPage(1);
                });
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
