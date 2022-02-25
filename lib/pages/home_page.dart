import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/model/scan_model.dart';
import 'package:qr_app/pages/addresses_page.dart';
import 'package:qr_app/pages/map_record_page.dart';
import 'package:qr_app/providers/db_provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';
import 'package:qr_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:qr_app/widgets/scan_fab_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Record"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: const ScanFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Get selected menu option
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsRecordPage();

      case 1:
        scanListProvider.loadScansByType('http');
        return const AddressesPage();

      default:
        return const MapsRecordPage();
    }
  }
}
